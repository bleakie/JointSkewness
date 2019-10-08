function [index] = JointSkewSingle(TA, sigmA, OptiBandNum)

NumBand = size(sigmA, 1);
index = zeros(1,NumBand);
for i = 1:NumBand
    index(i)=i;
end
k=NumBand;

while k > OptiBandNum
    for ii=1:k
        T1=TA;sigma=sigmA;
        T1(ii,:,:)=[];%%%%每次删除ii行
        T1(:,ii,:)=[];
        T1(:,:,ii)=[];
        sigma(ii,:)=[];
        sigma(:,ii)=[];
        R=reshape(T1,(k-1)*(k-1),(k-1));
        R1(:,ii)=svd(R'*R);K(:,ii)=svd(sigma);%%%%高阶奇异值分解
    end  
    for j1=1:k
        for i1=1:(k-1)
            s=(R1(i1,j1)/((K(i1,j1)^3)));%%%公式（10）
        end
        Q(j1)=prod(s,2);
    end
    [n1 n2]=max(Q);%%%删除最大偏度对应波段
    clear Q;   clear K;   clear R;   clear R1;
    TA(n2,:,:)=[];
    TA(:,n2,:)=[];
    TA(:,:,n2)=[];
    sigmA(:,n2)=[];
    sigmA(n2,:)=[];
    index(:,n2)=[];
    [f,k]=size(index);
end