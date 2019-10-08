function [index] = JointSkewMulti(DataTensor, Sigma0, OptiBandNum)
NumBand = size(Sigma0, 1) / 2;
%%找到对应波段位置
index = zeros(1,NumBand);
for i=1:NumBand
    index(i)=i;
end

k=NumBand;%%初始化波段数

while k> OptiBandNum
    kk=2*k;
    for ii=1:k
        Ta=DataTensor;Sigma1=Sigma0;
        Ta(ii+k,:,:)=[];%%%删除第ii行
        Ta(:,ii+k,:)=[];
        Ta(:,:,ii+k)=[];
        Sigma1(ii+k,:)=[];
        Sigma1(:,ii+k)=[];
        Ta(ii,:,:)=[];
        Ta(:,ii,:)=[];
        Ta(:,:,ii)=[];
        Sigma1(ii,:)=[];
        Sigma1(:,ii)=[];
        Ra=reshape(Ta,(kk-2)*(kk-2),(kk-2));%%因为双特征，每次删2，如果w特征就要每次删2w
        R1a(:,ii)=svd(Ra'*Ra);Ka(:,ii)=svd(Sigma1);%%奇异值分解
    end
    for j1=1:k
        for i1=1:(kk-2)
            sa=sqrt((R1a(i1,j1)/((Ka(i1,j1)^3))));%%对应公式（10）
        end
        Qa(j1)=prod(sa,2);%%返回每列元素的乘积
    end
    [n1a n2a]=max(Qa);
    n3=n2a;%%%得到最大JS对应得波段    
    clear Qa;clear Ka; clear Ra;clear R1a;%%清除每次得到的值，下次循环可以初始化
    DataTensor(n3+k,:,:)=[];%%%删除最大JS对应得波段
    DataTensor(:,n3+k,:)=[];
    DataTensor(:,:,n3+k)=[];
    DataTensor(n3,:,:)=[];
    DataTensor(:,n3,:)=[];
    DataTensor(:,:,n3)=[];
    Sigma0(n3+k,:)=[];
    Sigma0(:,n3+k)=[];
    Sigma0(n3,:)=[];
    Sigma0(:,n3)=[];
    index(:,n3)=[];
    [f,k]=size(index);
    
end
