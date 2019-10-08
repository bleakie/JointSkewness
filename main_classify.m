%%%分类model
clc
clear all
cd ('E:\实验室\我的实验\张量分析\main\data');
ncalSet_ab=xlsread('xunlian.xlsx');
nvalSet_c=xlsread('yuce.xlsx');
load X;load Y
cd ('E:\实验室\我的实验\张量分析\main');
SmoothNum = 5;%%平滑处理num
%%数据处理（归一化，平滑，特征联合）
[DataMean, DataShang] = MultiDataInitialize(X, SmoothNum);
Accu = [];
for rnd = 1:4
    %%%样本划分这部分先不写
    [Train_shang,Test_shang,Train_mean,Test_mean]=SampleHuafen(datax,datay,rnd);
    Cal_sel=mcalSet_ab_mean;
    Cvl_sel=mvalSet_c_mean;
    %%%%%%%svm建模%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    whiteningMatrix1 = White(Cal_sel);
    y=Cal_sel*whiteningMatrix1';
    yy=Cvl_sel*whiteningMatrix1';
    %%%%%%%%%%% SVM  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   [TrainAccu, TestAccu] = SvmModel(y,ncalSet_ab, yy, nvalSet_c);
   Accu0 = [TrainAccu; TestAccu];
   Accu = [Accu Accu0];
end


