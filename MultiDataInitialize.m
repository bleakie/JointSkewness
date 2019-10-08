function [xblock1, xmean] = MultiDataInitialize(X, Y, SmoothNum)
X0=X';Y0=Y';
[SampleNum, BandNum] = size(X0);
%%%%��һ��
for i=1:SampleNum
    for j=1:BandNum
        X1(i,j)=X0(i,j)/sqrt(sum(X0(i,:).^2));
        Y1(i,j)=Y0(i,j)/sqrt(sum(Y0(i,:).^2));
    end
end
%%%%ƽ��
for i=1:BandNum
    X2(:,i)=smooth(X0(:,i),SmoothNum);
    Y2(:,i)=smooth(Y0(:,i),SmoothNum);
end
xblock1=[X2,Y2];
samplemean=mean(xblock1); % ƽ��ͼƬ��1 �� N
xmean=[];
%%%%ȥ��ֵ
for i=1:SampleNum
    xmean(i,:)=xblock1(i,:)-samplemean;
end;

