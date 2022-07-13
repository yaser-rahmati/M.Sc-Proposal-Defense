%feature extraction
clc;
clear;
close all;
tic
load('data_final1');
xin=feat;
ptrain=0.7;

temp=y;



N=randperm(length(y));
Ntr=N(1:fix(length(y)*ptrain));
Nts=N(1+fix(length(y)*ptrain):end);

% y=log10(y+1000);
% y=y/1000;
% xin=abs(log10(xin));
xtr=xin(Ntr,:);
xts=xin(Nts,:);
ytr=y(Ntr);
yts=y(Nts);


% rahele=genfis2(xtr,ytr,0.5);
% rahmatii=fitcecoc(xtr,ytr);
% rahmatii= fitensemble(xtr,ytr,'AdaBoostM2',100,'tree') ; %44
% rahmatii= fitensemble(xtr,ytr,'LPBoost',100,'tree') ; %70
% rahmatii= fitensemble(xtr,ytr,'TotalBoost',100,'tree') ; %38
% rahmatii= fitensemble(xtr,ytr,'RUSBoost',100,'tree') ; %40

                                         


ytr_m=predict(rahmatii,xtr);
yts_m=predict(rahmatii,xts);
% ytr_m(ytr_m>7)=7;
% ytr_m(ytr_m<1)=1;
% yts_m(yts_m>7)=7;
% yts_m(yts_m<1)=1;



% ytr_m(ytr_m>=0)=1;
% ytr_m(ytr_m<0)=-1;
% 
% yts_m(yts_m>=0)=1;
% yts_m(yts_m<0)=-1;
% 
% fp=length(find(yts-yts_m==2))/length(yts(yts==1))*100
% tp=length(find(yts(yts==1)-yts_m(yts==1)==0))/length(yts(yts==1))*100
% fn=length(find(yts-yts_m==-2))/length(yts(yts==-1))*100
% tn=length(find(yts(yts==-1)-yts_m(yts==-1)==0))/length(yts(yts==-1))*100
% 
% 
% pr=tp/(tp+fp)
% rec=tp/(tp+fn)
% fm=2*pr*rec/(pr+rec)
% acc=(tp+tn)/(tp+tn+fp+fn)

err_tr=length(find(ytr-ytr_m'~=0))/length(ytr)*100;
err_ts=length(find(yts-yts_m'~=0))/length(yts)*100;



err_tr
err_ts


toc