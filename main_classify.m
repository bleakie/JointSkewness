%%%����model
clc
clear all
cd ('E:\ʵ����\�ҵ�ʵ��\��������\main\data');
ncalSet_ab=xlsread('xunlian.xlsx');
nvalSet_c=xlsread('yuce.xlsx');
load X;load Y
cd ('E:\ʵ����\�ҵ�ʵ��\��������\main');
SmoothNum = 5;%%ƽ������num
%%���ݴ�����һ����ƽ�����������ϣ�
[DataMean, DataShang] = MultiDataInitialize(X, SmoothNum);
Accu = [];
for rnd = 1:4
    %%%���������ⲿ���Ȳ�д
    [Train_shang,Test_shang,Train_mean,Test_mean]=SampleHuafen(datax,datay,rnd);
    Cal_sel=mcalSet_ab_mean;
    Cvl_sel=mvalSet_c_mean;
    %%%%%%%svm��ģ%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    whiteningMatrix1 = White(Cal_sel);
    y=Cal_sel*whiteningMatrix1';
    yy=Cvl_sel*whiteningMatrix1';
    %%%%%%%%%%% SVM  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   [TrainAccu, TestAccu] = SvmModel(y,ncalSet_ab, yy, nvalSet_c);
   Accu0 = [TrainAccu; TestAccu];
   Accu = [Accu Accu0];
end


