function [ output_args ] = gaussian_ml(a,b)

ml_mean_a = mean(a);


% real p(x)
x = 0:0.1:10;
y = gaussmf(x,[1 5]);
plot(x,y)
xlabel('gaussmf, P=[1 5]')


end

