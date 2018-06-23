function walking_final = get_mat_acc_new(filename,WINDOW_SIZE,SLIDE,value)

    fid = fopen(filename);
    walking = textscan(fid,'%f %f %f %f %f %s','Delimiter',',');
    fclose(fid);
    walking(:,6) = [];
    walking = cell2mat(walking);
    walking = sortrows(walking,2);
    time = walking(:,2);
    time(1,:) = [];
    walking = walking(:,3:5);
    walking(1,:) = [];
    walking_features = compute_features_new(time, walking(:,1:3),WINDOW_SIZE,SLIDE,250);
    walking_final = walking_features;
    walking_final  = [walking_final,ones(size(walking_final,1),1).*value];
end


    
