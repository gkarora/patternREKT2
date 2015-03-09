function [prob] = gauss2D(point,mu,Sigma)
term1 = 1 / (2*pi*sqrt(det(Sigma)));
term2 = -0.5 * ((point - mu) * inv(Sigma) * (point - mu)');
prob = term1*exp(term2);
end