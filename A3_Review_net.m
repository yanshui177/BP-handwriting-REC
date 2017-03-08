%%
warning off all;clear;clc;
load data;%data is data!
%a=find(lat>0.90);
dim=47;P = train_images*coef(:,1:dim);
test_P = test_images*coef(:,1:dim);
P = P'; test_P = test_P';
%%
% fprintf('PCA:20  knot:20 (1): \n');pause;load net_PCA020_knot20_log_mc02_0662;
% fprintf('PCA:20  knot:20 (2): \n');load net_PCA020_knot20_log_mc03;
% fprintf('PCA:25  knot:20: \n');load net_PCA025_knot20_log;
% fprintf('PCA:40  knot:40(1): \n');load net_PCA040_knot40;
% fprintf('PCA:40  knot:40(2): \n');load net_PCA040_knot40_log;
% fprintf('PCA:47  knot:40: \n');load net_PCA047_knot40_log_80;
fprintf('PCA:47  knot:40: \n');load net_PCA047_knot40_log_0.8167.mat;
% fprintf('PCA:47  knot:50: \n');load net_PCA047_knot50_log;
% fprintf('PCA:47  knot:50: \n');load net_PCA047_knot50_log667mc02;
% fprintf('PCA:47  knot:50: \n');load net_PCA047_knot50_log733
% fprintf('PCA:100  knot:50: \n');load ;
% fprintf('PCA:157  knot:80: \n');load ;
% fprintf('PCA:300  knot:20: \n');load ;
% fprintf('PCA:784  knot:20: \n');load ;
% fprintf('PCA:784  knot:20: \n');load ;
% fprintf('PCA:784  knot:20: \n');load ;
% fprintf('PCA:784  knot:20: \n');load ;

%%
sim1=sim(net,P);
[~ ,Y1] = max(sim1);
ratio1 = mean(Y1==double(train_labels'));%mean:first sum,then devide num.
fprintf('\t TrainRatio：%0.4g \n',ratio1);
%
sim2=sim(net,test_P);
[~ , Y2] = max(sim2);
ratio2 = mean(Y2==double(test_labels'));
fprintf('\t TestRatio：%0.4g \n',ratio2);

pie3([ratio2,1-ratio2],[1 2]);
title('采用BP神经网络手写体数字的识别率（47个输入，40个隐含层）');
legend('能够正确识别','不能识别');