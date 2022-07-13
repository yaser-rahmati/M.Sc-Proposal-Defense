%feature extraction
clc;
clear;
close all;
% load('total_data');
% xb=facs;
% load('landmarks');
% clear x;
load('Emotion');
load('total1');
count=1;
for i=1:size(facs,1)
    for j=1:size(facs,2)
        temp=facs(i,j,:);
        temp2=emotion{i,j};
        if(isempty(temp2)==1)
            continue;
        else
            
            qx=[];
            qy=[];
            for k=1:length(temp)
                temp1=temp{k};
                if(isempty(temp1)==1)
                    break;
                else
                    qx=[qx temp1(:,1)];
                    qy=[qy temp1(:,2)];
                    
                end
            end
            if(isempty(qx)==1)
                continue;
            end
            
            qx=(qx-min(qx(:)));
            qx=qx/max(qx(:));
            qy=(qy-min(qy(:)));
            qy=qy/max(qy(:));
            
            qx1=diff(qx');
            qx1(:,1)=[];
            qx2=diff(diff(qx)');
            qxx=[qx1 ; qx2];
            
            qy1=diff(qy');
            qy1(:,1)=[];
            qy2=diff(diff(qy)');
            qyy=[qy1 ; qy2];
            q2=eig(qxx'*qxx);
            q3=eig(qyy'*qyy);
            q2=sort(q2);
            q3=sort(q3);
            feat(count,:)=sort([q2(end-4:end) ; q3(end-4:end)]);
            y(count)=temp2;
            count=count+1;
            
            
            
        end
        
        
    end
end

save('data_final','feat','y');
