% ML Classifier for 3 classes
% INPUT:
% point: the point values as a row vector
% ma: the mean of class A
% mb: the mean of class B
% mc: the mean of class C
% Sa: covariance of class A
% Sb: covariance of class B
% Sc: covariance of class C
%
% OUTPUT: the number of the class the point might belong to
% 1 -> class A
% 2 -> class B
% 3 -> class C

function [classNum] = ml_3(point,...
    ma,Sa,...
    mb,Sb,...
    mc,Sc)

% all we care about here is the actual probability, and we want to pick the
% max of A, B, or C based on our distributions.

% fastest way is to use the [Y,I] = max(X)
% [Y,I] = max(X) returns the indices of the maximum values in vector I.
% matlab is 1-indexed.

    P = [gauss2D(point,ma,Sa) gauss2D(point,mb,Sb) gauss2D(point,mc,Sc)];
    [~,classNum] = max(P);
    
end