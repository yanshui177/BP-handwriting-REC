%%
warning off all
clear;clc;
load data; 
% a=find(lat>90);
%dim=1(1);%取贡献率达到0.90的前dim个数值
dim=50;
P = train_images*coef(:,1:dim);
test_P = test_images*coef(:,1:dim);
latent=latent';
P=bsxfun(@rdivide,P, sqrt(latent(1:dim)+1e-6));
test_P=bsxfun(@rdivide,test_P, sqrt(latent(1:dim)+1e-6));
P = P'; test_P = test_P';
%%
disp('Create ANN：020 inputs,30 knots,10 outputs purelin');
net=newff(minmax(P),[100,10],{'logsig','purelin'},'traingdx');
net.trainParam.epochs=1000;
net.trainParam.goal=1e-3;
net.trainParam.lr=0.5;
net.trainParam.mc=0.9;
% % net.trainParam.time=Inf;
% load baihua.mat;
% net.iw=iw;
% net.lw=lw;
% net.b=b;
disp('Training ANN...');
tic;net=train(net,P,T);toc
%%
sim1=sim(net,P);[~ ,Y1] = max(sim1);
ratio1 = mean(Y1==double(train_labels'));%mean:first sum,then devide num.
fprintf('Train ratio： %0.4g \n',ratio1);

sim2=sim(net,test_P);[~ , Y2] = max(sim2);
ratio2 = mean(Y2==double(test_labels'));
fprintf('Train ratio： %0.4g \n',ratio2);
%%
% save data coef lat T latent test_images train_images test_labels train_labels train_times;
% save net_PCA050_knot50_whiten_log_gda_mc00_390_P0.0188_0.9432.mat net
% save sim_PCA050_knot50_whiten_log_gda_mc00_390_P0.0188_0.9432.mat sim2

%%
% pos=test_labels(find(Y2~=double(test_labels')));
% figure
% pie3([ratio2 (1-ratio2)]);
% title('测试数据识别率(100个输入节点，50个隐层节点)');legend('正确识别','错误识别');