% SECTION THREE
clear all
close all

A = importdata('./BIG DATER/lab2_2.mat');
[ma,Sa] = getMeanCovar(A.al);
[mb,Sb] = getMeanCovar(A.bl);
[mc,Sc] = getMeanCovar(A.cl);


% show the cluster data, superimposed with the classification boundaries on
% the plot. 

figure(1)
scatter(A.al(:,1), A.al(:,2), 20, 'k', 'filled')
hold on
scatter(A.bl(:,1), A.bl(:,2), 20, 'b', 'filled')
scatter(A.cl(:,1), A.cl(:,2), 20, 'r', 'filled')
hold off
axis equal
legend('A','B','C')

%.... made a 3d grid

[ML2D_X, ML2D_Y, ML2D_CLASS] = makeGrid3(0.1, A.al, A.bl, A.cl);