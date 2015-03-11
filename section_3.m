% SECTION THREE
clear all
close all

A = importdata('./BIG DATER/lab2_2.mat');
[ma,Sa] = getMeanCovar(A.al);
[mb,Sb] = getMeanCovar(A.bl);
[mc,Sc] = getMeanCovar(A.cl);


% show the cluster data, superimposed with the classification boundaries on
% the plot. 

figure(310)
scatter(A.al(:,1), A.al(:,2), 20, 'k', 'filled')
hold on
scatter(A.bl(:,1), A.bl(:,2), 20, 'b', 'filled')
scatter(A.cl(:,1), A.cl(:,2), 20, 'r', 'filled')

axis equal


%.... made a 3d grid

[ML2D_X, ML2D_Y, ML2D_CLASS] = makeGrid3(1, A.al, A.bl, A.cl);

% next we need to classify the grid points as 1, 2, 3 based on the ML
% classifier.

for i = 1:size(ML2D_CLASS,1)
   for j = 1:size(ML2D_CLASS,2)
       z = [ML2D_X(j) ML2D_Y(i)];
       ML2D_CLASS(i,j) = ml_3(z,ma,Sa,mb,Sb,mc,Sc);
   end
end


contour(ML2D_X, ML2D_Y, ML2D_CLASS, 2, 'r');
legend('A','B','C','Decision Boundary')
hold off

