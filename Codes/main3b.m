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
            q2=qxx'.^2;
            q3=qyy'.^2;
            gg=sum(q2)+sum(q3);
            [~,q4]=sort(gg,'descend');
            q4=sort(q4(1:5));
            q5=sqrt(q2(:,q4)+q3(:,q4));
            
            
            
            feat(count,:)=q5(:);
            y(count)=temp2;
            count=count+1;
            
            
            
        end
        
        
    end
end

save('data_final1','feat','y');
