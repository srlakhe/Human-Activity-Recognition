clear;
close all;
clc;
WINDOW_SIZE = 12*1000;
SLIDE = 1000;
total_features  = [];
filenames = ["Walking.csv","Sitting.csv","Laying_down.csv","Standing.csv"];
for i = 1:4
    str = strcat('Test/',filenames(i));
    fid = fopen(str);
    walking = textscan(fid,'%f %f %f %f %f %*s','Delimiter',',');
    fclose(fid);
    walking = cell2mat(walking);
    time = walking(:,1);
    walking = walking(:,2:4);
    walking_features = compute_features_new(time,walking,WINDOW_SIZE,SLIDE,250);
    walking_features = [walking_features,ones(size(walking_features,1),1).*(i-1)];   
    total_features = [total_features; walking_features];
end
total_features = [0:size(total_features,2)-1;total_features];
csvwrite('Test_3200_1000_V.csv',total_features);
