%%%��ʵ�ֶ������²���ѡ��
clc
clear all
cd ('E:\ʵ����\�ҵ�ʵ��\��������\main\data');
ncalSet_ab=xlsread('xunlian.xlsx');
nvalSet_c=xlsread('yuce.xlsx');
load X;load Y
cd ('E:\ʵ����\�ҵ�ʵ��\��������\main');
SmoothNum = 5;%%ƽ������num
%%���ݴ�����һ����ƽ�����������ϣ�
[DataCombin, DataMean] = MultiDataInitialize(X, Y, SmoothNum);

Sigma0=cov(DataMean);%%Э����
U={DataCombin',DataCombin',DataCombin'};
DataTensor = cpdgen(U);%%%%%бƫ������
OptiBandNum = 15;%%%ѡ��Ĳ�����
%%%ѡ�񲨶�
index = JointSkewMulti(DataTensor, Sigma0, OptiBandNum);