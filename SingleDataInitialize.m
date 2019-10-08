function [xblock1, xmean] = SingleDataInitialize(X, SmoothNum)
X0=X';
[SampleNum, BandNum] = size(X0);
%%%%归一化
for i=1:SampleNum
    for j=1:BandNum
        X1(i,j)=X0(i,j)/sqrt(sum(X0(i,:).^2));
    end
end
%%%%平滑
for i=1:SampleNum
    X2(i,:)=smooth(X0(i,:),SmoothNum);
end
xblock1=[X2];
samplemean=mean(xblock1); % 平均图片，1 × N
xmean=[];
%%%%去均值
for i=1:SampleNum
    xmean(i,:)=xblock1(i,:)-samplemean;
end;

