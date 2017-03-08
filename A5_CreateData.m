%%
%This part of program create data!
warning off all
clear; clc;
load mnistAll;

train_row=size(mnist.train_images,1);train_col=size(mnist.train_images,2);
train_page=size(mnist.train_images,3);
test_row=size(mnist.test_images,1);test_col=size(mnist.test_images,2);
test_page=size(mnist.test_images,3);

%reshape to 784*60000
train_images=double(reshape(mnist.train_images,train_row*train_col,train_page)');
test_images=double(reshape(mnist.test_images,test_row*test_col,test_page)');
% 
%Normalizating..
disp('Normalizating...');
train_images=bsxfun(@times,train_images,1./sum(train_images,2));
test_images=bsxfun(@times,test_images,1./sum(test_images,2));

%PCA Reduce dimention...
disp('Reduce dimention...');[coef,~,latent]=princomp(train_images);
lat=cumsum(latent)./sum(latent);

train_labels=mnist.train_labels+1;test_labels=mnist.test_labels+1;
T=zeros(10,60000);%vertex
for i=1:60000
    T(train_labels(i),i)=1;
end
P = train_images*coef;
test_P = test_images*coef;
% P = train_images;
% test_P = test_images;
% %whiten...
% latent=latent';
% P=bsxfun(@rdivide,P, sqrt(latent+1e-6));
% test_P=bsxfun(@rdivide,test_P, sqrt(latent+1e-6));
%zhuanzhi
P = P'; test_P = test_P';test_T=test_labels;

% save data lat P T test_P  test_T;
