%%%可实现多特征下波段选择
clc
clear all
cd ('E:\实验室\我的实验\张量分析\main\data');
ncalSet_ab=xlsread('xunlian.xlsx');
nvalSet_c=xlsread('yuce.xlsx');
load X;load Y
cd ('E:\实验室\我的实验\张量分析\main');
SmoothNum = 5;%%平滑处理num
%%数据处理（归一化，平滑，特征联合）
[DataCombin, DataMean] = MultiDataInitialize(X, Y, SmoothNum);

Sigma0=cov(DataMean);%%协方差
U={DataCombin',DataCombin',DataCombin'};
DataTensor = cpdgen(U);%%%%%斜偏度张量
OptiBandNum = 15;%%%选择的波段数
%%%选择波段
index = JointSkewMulti(DataTensor, Sigma0, OptiBandNum);