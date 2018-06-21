function features = compute_features_new(time, walking,WINDOW_SIZE, SLIDING_WINDOW,Fs)
    features = [];
    smv_walking = rssq(walking,2);
    prev_f1 = 1;
    i = 1;
    while i < size(time,1)
        temp_end = i;
        while temp_end < size(time,1) && time(temp_end,1) < time(i,1)+WINDOW_SIZE
            temp_end = temp_end+1;
        end
        if (temp_end - i) < 600
            i = temp_end;
            continue;
        end
        
        X = smv_walking(i:temp_end-1,:);
        X_temp = walking(i:temp_end-1,:);
        mean_X = mean(X);
        std_X = std(X);
        % Fs = 250;
        L = WINDOW_SIZE;
    %     Y = fft(X);
    %     P2 = abs(Y/L);
    %     P1 = P2(1:L/2+1);
    %     P1(2:end-1) = 2*P1(2:end-1);
    %     f = Fs*(0:(L/2))/L;
        Y = fftshift(X);
        f = (-L/2:L/2-1)*(Fs/L);  % zero-centered frequency range
        powershift = abs(Y).^2/L;     % zero-centered power
        P1 = powershift;
        temp = P1;

        [p1,f1] = max(temp);
        temp(f1) = -Inf;
        f1 = f(f1);

        [p2,f2] = max(temp);
        f2 = f(f2);

        [p65,f65] = max(P1(Fs*2+3:Fs*2+11)); %Need to change it depending on Window Size
        f65 = f(Fs*2+2+f65);
        ratio_p = p1/rssq(P1);
        if prev_f1==0
            prev_f1 = 1;
        end
        ratio_f = f1/prev_f1;
        prev_f1 = f1;

        % New features
        new_features = [];
        for u = 1:size(walking,2)
            for v = u+1:size(walking,2)
                R = corrcoef(X_temp(:,u),X_temp(:,v));
                new_features = [new_features,(R(1,2)/(R(1,1)*R(2,2)))];
            end
        end   
        
        % wavelet features
        [cA,cD] = dwt(X,'DB10');
        alpha = 5;
        beta  =6;
        DWT_SMV = rssq(cD(alpha:beta,:))/rssq(X);
        DWT_SMV = DWT_SMV*DWT_SMV;
        J= 8;
        DWT_SMV1 = rssq(cD(alpha:beta,:))/rssq(cD(1:J));
        DWT_SMV1 = DWT_SMV1*DWT_SMV1;
        features = [features;mean_X,std_X,p1,f1,p2,f2,p65,f65,ratio_p,ratio_f,rssq(P1),new_features,DWT_SMV,DWT_SMV1];
        
        temp_slide = i;
        while temp_slide < size(time,1) && time(temp_slide,1) < time(i,1)+SLIDING_WINDOW
            temp_slide = temp_slide +1;
        end
        i = temp_slide;
    end
