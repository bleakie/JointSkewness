
%%%单特征波段选择
clc
clear all
cd ('E:\实验室\我的实验\张量分析\main\data');
ncalSet_ab=xlsread('xunlian.xlsx');
nvalSet_c=xlsread('yuce.xlsx');
load X;load Y
cd ('E:\实验室\我的实验\张量分析\main');
SmoothNum = 5;%%平滑处理num
%%数据处理（归一化，平滑，特征联合）
[DataSingle, DataMean] = SingleDataInitialize(X, SmoothNum);
%%%%协方差矩阵
sigmA=cov(DataMean);
%%%%斜偏度张量
M = 1/size(DataSingle,1);
U={DataSingle',DataSingle',DataSingle'};
TA = cpdgen(U);
OptiBandNum = 15;%%选择的波段数
index = JointSkewSingle(TA, sigmA, OptiBandNum);



