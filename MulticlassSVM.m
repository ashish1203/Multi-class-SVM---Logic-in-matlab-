%%%%%%%%%%%%%% Single Class%%%%%%%%%%%%%
T=[ 1 10;2 20;3 30;4 40]
C=[1;1;2;2]
 
svmStruct = svmtrain(T,C,'showplot',true);
classes = svmclassify(svmStruct,[1.5 15],'showplot',true)
%% %% # 3 Class
T=[ 1 10;2 20;3 30;3 31;3 32;3 32;4 40;4 42]
C=[1;1;2;2;2;2;3;3]
tst=[3 35]
%svmStruct = svmtrain(T,C,'showplot',true);
%classes = svmclassify(svmStruct,[1.5 15],'showplot',true)
u=unique(C);
N=length(u);
if(N>2)
    disp('multi class problem');
    itr=1;
    classes=0;
    while((classes~=1)&&(itr<=length(u)))
%this while loop is the multiclass SVM Trick
    c1=(C==u(itr));
    newClass=c1;
    svmStruct = svmtrain(T,newClass,'showplot',true);
    classes = svmclassify(svmStruct,tst,'showplot',true)
    itr=itr+1
    end
%clc;
itr=itr-1;
disp(itr)
end