%%
clear; clc;
load mnistAll;
load('parameter_ones_PCA_princomp.mat')
train_times=1000;a=find(lat>0.95);main=a(1);
P=train_images*coef(:,1:main);test_P=test_images*coef(:,1:main);
P=P';test_P=test_P';
%½«1£º9Ó³Éäµ½1£º10
train_labels=mnist.train_labels+1;test_labels=mnist.test_labels+1;
T=zeros(10,60000);%vertex
for i=1:60000
    T(train_labels(i),i)=1;
end
%%
disp('Knot:100,PCA:157:');load net_iter_100_11000times74;
sim201=sim(net,test_P);
[~ , Y201] = max(sim201);
ratio201 = mean(Y201==double(test_labels'));
fprintf('\tTest ratio1£º%0.4g \n',ratio201);
%%
disp('Knot:150,PCA:157:');load net_iter_150_xtimes77;
sim202=sim(net,test_P);
[~ , Y202] = max(sim202);
ratio202 = mean(Y202==double(test_labels'));
fprintf('\tTest ratio2£º%0.4g \n',ratio202);
%%
disp('Knot:150,PCA:157:');load net_PCA157_knot80_log;
sim203=sim(net,test_P);
[~ , Y203] = max(sim203);
ratio203 = mean(Y203==double(test_labels'));
fprintf('\tTest ratio3£º%0.4g \n',ratio202);
%%
disp('After 150&100 fusion:');
sim2=sim201+sim202;
[~ , Y2] = max(sim2);
ratio2 = mean(Y2==double(test_labels'));
fprintf('\tTest ratio12£º%0.4g \n',ratio2);

%%
disp('After 150&80 fusion:');
sim2=sim201+sim203;
[~ , Y2] = max(sim2);
ratio2 = mean(Y2==double(test_labels'));
fprintf('\tTest ratio13£º%0.4g \n',ratio2);
%%
disp('After _&100&80 fusion:');
sim21=sim202+sim203;
[~ , Y21] = max(sim21);
ratio21 = mean(Y21==double(test_labels'));
fprintf('\tTest ratio13£º%0.4g \n',ratio21);
%%
disp('After 150&80&100 fusion:');
sim3=sim201+sim202+sim203;
[~ , Y2] = max(sim3);
ratio3 = mean(Y2==double(test_labels'));
fprintf('\tTest ratio123£º%0.4g \n',ratio3);
%%
disp('\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
load A_sim_PCA047_knot40_log;
load B_sim_PCA047_knot40_log_mc03;
sim000=sim2+sim3;
[~ , Y000] = max(sim000);
ratio000 = mean(Y000==double(test_labels'));
fprintf('\tTest ratio123£º%0.4g \n',ratio000);
