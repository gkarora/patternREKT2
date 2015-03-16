function [ ] = nonparam_est( )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
A = importdata('./BIG DATER/lab2_2.mat');
S = eye(2).*sqrt(400);

    function [class] = get_class(pt)
        function[prob] = get_prob(class)
            prob = 0;
            for k = 1:length(class)
                prob = prob + gauss2D(pt, class(k, :), S);
            end 
            prob = prob/length(class);
        end
        prob_a = get_prob(A.al);
        prob_b = get_prob(A.bl);
        prob_c = get_prob(A.cl);
        [~, class_num] = max([prob_a prob_b prob_c]);
        class = class_num;
    end

% show the cluster data, superimposed with the classification boundaries on
% the plot. 

figure(320)
scatter(A.al(:,1), A.al(:,2), 20, 'k', 'filled')
hold on
scatter(A.bl(:,1), A.bl(:,2), 20, 'b', 'filled')
scatter(A.cl(:,1), A.cl(:,2), 20, 'r', 'filled')

scatter(A.at(:,1), A.at(:,2), 20, 'k', 'd')
scatter(A.bt(:,1), A.bt(:,2), 20, 'b', 'd')
scatter(A.ct(:,1), A.ct(:,2), 20, 'r', 'd')

axis equal

[GAUSS2D_X, GAUSS2D_Y, GAUSS2D_CLASS] = makeGrid3(5, A.at, A.bt, A.ct);
    
for i = 1:size(GAUSS2D_CLASS,1)
   for j = 1:size(GAUSS2D_CLASS,2)
       z = [GAUSS2D_X(j) GAUSS2D_Y(i)];
       GAUSS2D_CLASS(i,j) = get_class(z);
   end
end


contour(GAUSS2D_X, GAUSS2D_Y, GAUSS2D_CLASS, 2, 'r');
legend('A_{learn}','B_{learn}','C_{learn}','A_{test}','B_{test}','C_{test}','Decision Boundary')
title('Classification Boundary Of 2-D Non-Parametric Estimated PDF With Training And Test Data')
xlabel('x_1')
ylabel('x_2')
hold off
    
end

