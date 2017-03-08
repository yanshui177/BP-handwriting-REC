%%
warning off all
% clear;clc;
% load data; 
dim=5;
P = train_images*coef(:,1:dim);
test_P = test_images*coef(:,1:dim);
P = P'; test_P = test_P';
%%
disp('Create ANN£º030 inputs,20 knots,10 outputs purelin');
net=newff(minmax(P),[30,10],{'logsig','purelin'},'traingdx');
net.trainParam.epochs=1000;
net.trainParam.goal=1e-2;
net.trainParam.lr=0.5;
net.trainParam.mc=0.9;
% % net.trainParam.time=Inf;
% load weight_50_50_0.0547.mat;
% net.iw=iw;
% net.lw=lw;
% net.b=b;
disp('Training ANN...');
tic;net=train(net,P,T);toc
%%
sim1=sim(net,P);[~ ,Y1] = max(sim1);
ratio1 = mean(Y1==double(train_labels'));%mean:first sum,then devide num.
fprintf('Train ratio£º %0.4g \n',ratio1);

sim2=sim(net,test_P);[~ , Y2] = max(sim2);
ratio2 = mean(Y2==double(test_labels'));
fprintf('Train ratio£º %0.4g \n',ratio2);
%%
% save net_PCA050_knot50_log_mc09_499_P.mat net
% save sim_PCA050_knot50_log_mc09_570_P0.0474_0.8435.mat sim2