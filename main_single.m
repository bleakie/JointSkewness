
%%%����������ѡ��
clc
clear all
cd ('E:\ʵ����\�ҵ�ʵ��\��������\main\data');
ncalSet_ab=xlsread('xunlian.xlsx');
nvalSet_c=xlsread('yuce.xlsx');
load X;load Y
cd ('E:\ʵ����\�ҵ�ʵ��\��������\main');
SmoothNum = 5;%%ƽ������num
%%���ݴ�����һ����ƽ�����������ϣ�
[DataSingle, DataMean] = SingleDataInitialize(X, SmoothNum);
%%%%Э�������
sigmA=cov(DataMean);
%%%%бƫ������
M = 1/size(DataSingle,1);
U={DataSingle',DataSingle',DataSingle'};
TA = cpdgen(U);
OptiBandNum = 15;%%ѡ��Ĳ�����
index = JointSkewSingle(TA, sigmA, OptiBandNum);



