function [index] = JointSkewMulti(DataTensor, Sigma0, OptiBandNum)
NumBand = size(Sigma0, 1) / 2;
%%�ҵ���Ӧ����λ��
index = zeros(1,NumBand);
for i=1:NumBand
    index(i)=i;
end

k=NumBand;%%��ʼ��������

while k> OptiBandNum
    kk=2*k;
    for ii=1:k
        Ta=DataTensor;Sigma1=Sigma0;
        Ta(ii+k,:,:)=[];%%%ɾ����ii��
        Ta(:,ii+k,:)=[];
        Ta(:,:,ii+k)=[];
        Sigma1(ii+k,:)=[];
        Sigma1(:,ii+k)=[];
        Ta(ii,:,:)=[];
        Ta(:,ii,:)=[];
        Ta(:,:,ii)=[];
        Sigma1(ii,:)=[];
        Sigma1(:,ii)=[];
        Ra=reshape(Ta,(kk-2)*(kk-2),(kk-2));%%��Ϊ˫������ÿ��ɾ2�����w������Ҫÿ��ɾ2w
        R1a(:,ii)=svd(Ra'*Ra);Ka(:,ii)=svd(Sigma1);%%����ֵ�ֽ�
    end
    for j1=1:k
        for i1=1:(kk-2)
            sa=sqrt((R1a(i1,j1)/((Ka(i1,j1)^3))));%%��Ӧ��ʽ��10��
        end
        Qa(j1)=prod(sa,2);%%����ÿ��Ԫ�صĳ˻�
    end
    [n1a n2a]=max(Qa);
    n3=n2a;%%%�õ����JS��Ӧ�ò���    
    clear Qa;clear Ka; clear Ra;clear R1a;%%���ÿ�εõ���ֵ���´�ѭ�����Գ�ʼ��
    DataTensor(n3+k,:,:)=[];%%%ɾ�����JS��Ӧ�ò���
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
