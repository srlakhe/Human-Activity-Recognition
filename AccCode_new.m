clear all;
close all;
clc;

WINDOW_SIZE = 12*1000;
SLIDE = 4*1000;

walking_features = get_mat_new_1('./FinalData/Train/TrainCombinedFile_walking.csv',WINDOW_SIZE,SLIDE,0);
sitting_features = get_mat_new_1('./FinalData/Train/TrainCombinedFile_sitting.csv',WINDOW_SIZE,SLIDE,1);
laying_features  = get_mat_new_1('./FinalData/Train/TrainCombinedFile_laying.csv',WINDOW_SIZE,SLIDE,2);
standing_features = get_mat_new_1('./FinalData/Train/TrainCombinedFile_standing.csv',WINDOW_SIZE,SLIDE,3);

total_features = [walking_features;sitting_features;laying_features;standing_features];
total_features = [0:size(total_features,2)-1;total_features];
filename = strcat('TrainData_',num2str(WINDOW_SIZE),'_',num2str(SLIDE),'.csv');
csvwrite(filename,total_features);









