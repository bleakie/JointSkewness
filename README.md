# JointSkewness
基于联合偏度的高光谱图像波段选择对玉米种子分类研究
Application of Joint Skewness Algorithm to Select Optimal Wavelengths of Hyperspectral Image for Maize Seed Classification
 
论文地址：https://www.researchgate.net/publication/317750407_Application_of_Joint_Skewness_Algorithm_to_Select_Optimal_Wavelengths_of_Hyperspectral_Image_for_Maize_Seed_Classification

## 1.安装

（0）开发环境win+matlab

（1）LibSVM

（3）TensorToolbox

## 2.数据处理
由于涉及隐私数据，因此不公开原始数据，按照论文步骤直接得到结果（.mat文件），参见1.Materials and Methods

## 3.结果

在 10 个最优波段条件下,联合特征分类模型的识别精度达到了 96.28%,比光谱均值和图像熵的识别精度分别提高了 4.30%和20.38%,也高于全波段联合特征识别模型的 93.47%

（1）全波段单特征&多特征

![MASK0](https://github.com/bleakie/MaskInsightface/blob/master/images/Akbar_Al_Baker_0001.jpg)

（2）单特征&多特征下的波段选择

![MASK0](https://github.com/bleakie/MaskInsightface/blob/master/images/Akbar_Al_Baker_0001.jpg)

（3）单特征&多特征下的波段选择后详细分类结果

![MASK0](https://github.com/bleakie/MaskInsightface/blob/master/images/Akbar_Al_Baker_0001.jpg)

（4）多特征&不同波段选择方法比较

![MASK](https://github.com/bleakie/JointSkewness/blob/master/result/compare.png)
