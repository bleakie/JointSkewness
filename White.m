function whiteningMatrix1 = White(Cal_sel)    
samplemean=mean(Cal_sel); % ƽ��ͼƬ��1 �� N
num = size(Cal_sel,1);
    xmean1=[];
    for i=1:num
        xmean1(i,:)=Cal_sel(i,:)-samplemean; % xmean��һ��M �� N����xmeanÿһ�б���������ǡ�ÿ��ͼƬ����-ƽ��ͼƬ��
    end;
    sigm=cov(xmean1);   % M * M �׾���
    [E1,D1] = eig(sigm);
    %������������������������׻����󡪡�������������������
    whiteningMatrix1 =E1*inv(sqrt(D1)) * E1';