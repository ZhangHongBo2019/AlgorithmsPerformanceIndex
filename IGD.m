%function Score = IGD(PopObj,ObjV)
% <metric> <min>
% Inverted generational distance

%--------------------------------------------------------------------------
% Copyright (c) 2016-2017 BIMK Group. You are free to use the PlatEMO for
% research purposes. All publications which use this platform or any code
% in the platform should acknowledge the use of "PlatEMO" and reference "Ye
% Tian, Ran Cheng, Xingyi Zhang, and Yaochu Jin, PlatEMO: A MATLAB Platform
% for Evolutionary Multi-Objective Optimization [Educational Forum], IEEE
% Computational Intelligence Magazine, 2017, 12(4): 73-87".
%--------------------------------------------------------------------------
load SPCT.mat;
N=30;
trace=zeros(1,N);
for i=1:N
[chromosome,V]=nsga_2_optimization(50,50);
PopObj= chromosome(:, V+1 : V+3);
Distance = min(pdist2(ObjV,PopObj),[],2);
trace(1,i)=mean(Distance);
end
MaxIGD=max(trace);
MinIGD=min(trace);
AveIGD=mean(trace);
StdIGD=std(trace);
disp(['30�ε�IGD�����ֵΪ:',num2str(MaxIGD)]);
disp(['30�ε�IGD����СֵΪ:',num2str(MinIGD)]);
disp(['30�ε�IGD��ƽ��ֵΪ:',num2str(AveIGD)]);
disp(['30�ε�IGD�ı�׼��Ϊ:',num2str(StdIGD)]);
figure;
plot(1:N,trace(1,:),"r*-");
xlabel("����");ylabel("IGD ֵ");
title("30�������IGD��ֵ�ı仯");