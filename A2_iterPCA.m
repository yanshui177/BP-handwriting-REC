% %%
% if ~exist('net','var')
%     load net_PCA047_knot40_log_0.8167.mat;
% end
% if ~exist('P','var')
%     load data;
%     a = find(lat>90);
%     %dim=1(1);%取贡献率达到0.90的前dim个数值
%     dim = 47;
%     P = train_images*coef(:,1:dim);
%     test_P = test_images*coef(:,1:dim);
%     P = P'; test_P = test_P';
% end
%%
for iter=1:10
    fprintf('\n Attention: %dth ite：',iter);
    fprintf('Iterating...\n'); net=train(net,P,T);
    %%
    sim1=sim(net,P);[~ ,Y1] = max(sim1);
    ratio1 = mean(Y1==double(train_labels'));
    fprintf('\tTrain ratio： %0.4g \n',ratio1);
    
    sim2=sim(net,test_P);[~ , Y2] = max(sim2);
    ratio2 = mean(Y2==double(test_labels'));
    fprintf('\tTest ratio： %0.4g \n',ratio2);
end
% save net_PCA040_knot40_log_mc09_575_P0.7884_0.07884.mat net

%     sim2=sim(net,test_P);[~ , Y2] = max(sim_2_8072);
%     ratio2 = mean(Y2==double(test_labels'));
%     fprintf('\tTest ratio： %0.4g \n',ratio2);