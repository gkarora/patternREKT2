function [lambda] = parametric_exponential( data )

summation = sum(data(:));
num = length(data);
x_bar = summation / num;

lambda = -1/x_bar;
end

