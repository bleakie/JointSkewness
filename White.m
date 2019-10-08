function whiteningMatrix1 = White(Cal_sel)    
samplemean=mean(Cal_sel); % 平均图片，1 × N
num = size(Cal_sel,1);
    xmean1=[];
    for i=1:num
        xmean1(i,:)=Cal_sel(i,:)-samplemean; % xmean是一个M × N矩阵，xmean每一行保存的数据是“每个图片数据-平均图片”
    end;
    sigm=cov(xmean1);   % M * M 阶矩阵
    [E1,D1] = eig(sigm);
    %——————————计算白化矩阵———————————
    whiteningMatrix1 =E1*inv(sqrt(D1)) * E1';