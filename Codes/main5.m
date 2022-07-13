clc;
clear
close all;
load('finals1');
q=[];
for j=1:10
    q=[q ybb{j}];
end
qq=mode(q');
err_ts=length(find(y-qq~=0))/length(y)*100
err_tr=0