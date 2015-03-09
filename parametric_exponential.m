function [] = parametric_exponential( a,b )
    function [lambda] = get_lambda (data)
        summation = sum(data(:));
        num = length(data);
        x_bar = summation / num;

        lambda = 1/x_bar;
    end


lambda_a = get_lambda(a);
lambda_b = get_lambda(b);

x = 0:0.1:5;
est_y_a = exppdf(x, lambda_a);
est_y_b = exppdf(x, lambda_b);

act_y_b = exppdf(x, 1);
act_y_a = exppdf(x, 2); %%DONT KNOW THIS IS WRONG
figure(201);
plot(x, act_y_a, 'g');
hold on;
plot(x, est_y_a, 'r');
hold off;

figure(202);
plot(x, act_y_b, 'g');
hold on;
plot(x, est_y_b, 'r');
hold off;
end

