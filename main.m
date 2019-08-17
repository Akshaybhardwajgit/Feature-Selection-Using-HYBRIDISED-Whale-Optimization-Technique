

clear all
clc
global A trn vald a;
SearchAgents_no=5; % Number of search agents
Max_iteration=100; % Maximum number of iterations

A=load('heart.dat');
sumScore = 0;
minScore = 1;
maxScore = 0;
r=randperm(size(A,1));
trn=r(1:floor(length(r)/2));
vald=r(floor(length(r)/2)+1:end);
tic
[Best_score,Best_pos,WOA_cg_curve,fName]=WOASA(SearchAgents_no,(Max_iteration),0,1,size(A,2)-1,'AccSz');
time = toc;
acc = Acc(Best_pos);
fprintf('Acc  %f\tFitness:  %f\tSolution:  %s\tDimension: %d\tTime:  %f\n',acc,Best_score,num2str(Best_pos,'%1d'),sum(Best_pos(:)),time);

