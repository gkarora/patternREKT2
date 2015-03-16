function [ ] = nonparam_est( )
clear all 
close all
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



[GAUSS2D_X, GAUSS2D_Y, GAUSS2D_CLASS] = makeGrid3(5, A.at, A.bt, A.ct);

ML2D_CLASS = GAUSS2D_CLASS;

[ma,Sa] = getMeanCovar(A.al);
[mb,Sb] = getMeanCovar(A.bl);
[mc,Sc] = getMeanCovar(A.cl);
    
for i = 1:size(GAUSS2D_CLASS,1)
   for j = 1:size(GAUSS2D_CLASS,2)
       z = [GAUSS2D_X(j) GAUSS2D_Y(i)];
       GAUSS2D_CLASS(i,j) = get_class(z);
   end
end



for i = 1:size(ML2D_CLASS,1)
   for j = 1:size(ML2D_CLASS,2)
       z = [GAUSS2D_X(j) GAUSS2D_Y(i)];
       ML2D_CLASS(i,j) = ml_3(z,ma,Sa,mb,Sb,mc,Sc);
   end
end

figure(310) % just ML. also should plot sample mean and sample covariance.
scatter(A.al(:,1), A.al(:,2), 20, 'k', 'filled')
hold on
scatter(A.bl(:,1), A.bl(:,2), 20, 'b', 'filled')
scatter(A.cl(:,1), A.cl(:,2), 20, 'r', 'filled')

scatter(A.at(:,1), A.at(:,2), 20, 'k', 'd')
scatter(A.bt(:,1), A.bt(:,2), 20, 'b', 'd')
scatter(A.ct(:,1), A.ct(:,2), 20, 'r', 'd')

contour(GAUSS2D_X, GAUSS2D_Y, ML2D_CLASS, 2, 'r');

%plot sample means
scatter([ma(1) mb(1) mc(1)], [ma(2) mb(2) mc(2)], 40, 'g', 'filled')

%equiprobability contours
baseEllipse = ellipse(0,0,0,1,1)';
contourA = apply_class(ma,Sa,length(baseEllipse), baseEllipse);
contourB = apply_class(mb,Sb,length(baseEllipse), baseEllipse);
contourC = apply_class(mc,Sc,length(baseEllipse), baseEllipse);

plot(contourA(:,1), contourA(:,2), 'g')
plot(contourB(:,1), contourB(:,2), 'g')
plot(contourC(:,1), contourC(:,2), 'g')

axis equal

legend('A_{learn}','B_{learn}','C_{learn}','A_{test}','B_{test}',...
       'C_{test}','Decision Boundary (ML)')
xlabel('x_1')
ylabel('x_2')
hold off
title('Classification Boundaries Of Parametric Estimated PDF Using ML Classifier With Training And Test Data')


figure(320) % just the nonparam_est
scatter(A.al(:,1), A.al(:,2), 20, 'k', 'filled')
hold on
scatter(A.bl(:,1), A.bl(:,2), 20, 'b', 'filled')
scatter(A.cl(:,1), A.cl(:,2), 20, 'r', 'filled')

scatter(A.at(:,1), A.at(:,2), 20, 'k', 'd')
scatter(A.bt(:,1), A.bt(:,2), 20, 'b', 'd')
scatter(A.ct(:,1), A.ct(:,2), 20, 'r', 'd')
axis equal
contour(GAUSS2D_X, GAUSS2D_Y, GAUSS2D_CLASS, 2, 'r');

legend('A_{learn}','B_{learn}','C_{learn}','A_{test}','B_{test}',...
       'C_{test}','Decision Boundary (Non-Parametric)')
xlabel('x_1')
ylabel('x_2')
hold off
title('Classification Boundaries Of 2-D Non-Parametric Estimated PDF With Training And Test Data')

figure(321) %nonparam_est with estimated ML
scatter(A.al(:,1), A.al(:,2), 20, 'k', 'filled')
hold on
scatter(A.bl(:,1), A.bl(:,2), 20, 'b', 'filled')
scatter(A.cl(:,1), A.cl(:,2), 20, 'r', 'filled')
scatter(A.at(:,1), A.at(:,2), 20, 'k', 'd')
scatter(A.bt(:,1), A.bt(:,2), 20, 'b', 'd')
scatter(A.ct(:,1), A.ct(:,2), 20, 'r', 'd')
axis equal
contour(GAUSS2D_X, GAUSS2D_Y, GAUSS2D_CLASS, 2, 'r');
contour(GAUSS2D_X, GAUSS2D_Y, ML2D_CLASS, 2, 'b');
legend('A_{learn}','B_{learn}','C_{learn}','A_{test}','B_{test}',...
       'C_{test}','Decision Boundary (Non-Parametric)', 'Decision Boundary (ML)')
xlabel('x_1')
ylabel('x_2')
title('Classification Boundaries Of 2-D Non-Parametric Estimated PDF And Parametric-Estimated ML Classifier With Training And Test Data')
hold off

    
end

