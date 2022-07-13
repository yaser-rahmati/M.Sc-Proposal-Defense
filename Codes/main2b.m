clc;
clear ;
close all;
path1='extended-cohn-kanade-images';
path2='Landmarks';
path3='FACS_labels';

q=dir(path3);

cd(path3);
for i=3:length(q)
    temp=q(i,1).name;
    q1=dir(temp);
    cd(temp);
    for j=3:length(q1)
        temp1=q1(j,1).name;
        if(isdir(temp1)==1)
            q2=dir(temp1);
            cd(temp1)
            temp2=q2(3,1).name;
            facs{i-2,j-2}=load(temp2);
            
            cd('..')
            f1{i-2,j-2}=temp;
            f2{i-2,j-2}=temp1;
        end
        
        
        
    end
    cd('..')
    
end

cd('..');
save('Facs');