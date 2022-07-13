clc;
clear ;
close all;
path1='extended-cohn-kanade-images';
path2='Landmarks';

q=dir(path2);

cd(path2);
for i=3:length(q)
    temp=q(i,1).name;
    q1=dir(temp);
    cd(temp);
    for j=3:length(q1)
        temp1=q1(j,1).name;
        if(isdir(temp1)==1)
            q2=dir(temp1);
            cd(temp1)
            for k=3:length(q2)
                temp2=q2(k,1).name;
                if(strcmp(temp2(end-3:end),'.txt')~=1)
                    continue;
                else
                    facs{i-2,j-2,k-2}=load(temp2);
                    f3{i-2,j-2,k-2}=temp2;
                end
                
                
                
            end
            cd('..')
            f1{i-2,j-2}=temp;
            f2{i-2,j-2}=temp1;
            
            
            
        end
    end
    cd('..')
    
end

cd('..');
save('landmarks');