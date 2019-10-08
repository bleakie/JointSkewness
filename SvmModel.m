function [Percent1, Percent2] = SvmModel(y,ncalSet_ab, yy, nvalSet_c)
[bestacc,bestc,bestg] = SVMcgForClass(ncalSet_ab,y,-10,10,-10,10);
% ��ӡ����ѡ����
str = sprintf( ' Accuracy = %g%% Best c = %g Best g = %g',bestacc,bestc,bestg);
disp(str);
% ������ѵĲ�������SVM����ѵ��
cmd = ['-c ',num2str(bestc),' -g ',num2str(bestg)];
model = svmtrain(ncalSet_ab,y, cmd);
% SVM����ѵ��
[predict_label1,accuracy] = svmpredict(ncalSet_ab,y,model);
Percent1=accuracy(1)/100;
% SVM����Ԥ��
[predict_label2,accuracy] = svmpredict(nvalSet_c,yy,model);
Percent2=accuracy(1)/100;