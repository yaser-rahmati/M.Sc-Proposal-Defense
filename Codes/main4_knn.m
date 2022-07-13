%feature extraction
clc;
clear;
close all;
tic
load('data_final1');
xin=feat;
ptrain=0.7;

temp=y;
xin=log10(xin);
xin=xin-min(xin(:));
xin=xin./max(xin(:));

for j=1:10    
    N=randperm(length(y));
    Ntr=N(1:fix(length(y)*ptrain));
    Nts=N(1+fix(length(y)*ptrain):end);
    
    % y=log10(y+1000);
    % y=y/1000;
    
    xtr=xin(Ntr,:);
    xts=xin(Nts,:);
    ytr=y(Ntr);
    yts=y(Nts);

    rahmatii= fitcknn(xtr,ytr) ; %train 0
    % rahmatii= genfis3(xtr,ytr) ; %train 85
    
    rahmat{j}=rahmatii;
    
    
    
    ytr_m=predict(rahmatii,xtr);
    yts_m=predict(rahmatii,xts);
    ytr_m(ytr_m>7)=7;
    ytr_m(ytr_m<1)=1;
    yts_m(yts_m>7)=7;
    yts_m(yts_m<1)=1;
    
    
    ybb{j}=predict(rahmatii,xin);
    
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
    
    err_tr(j)=length(find(ytr-ytr_m'~=0))/length(ytr)*100;
    err_ts(j)=length(find(yts-yts_m'~=0))/length(yts)*100;
    
    if(err_tr(j)+err_ts(j)<20)
        break;
    end
end


% q=[];
% for j=1:10
    
save('finals1');


err_tr
err_ts


toc