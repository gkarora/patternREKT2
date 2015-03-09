function [m,S] = getMeanCovar(A)
m = (sum(A) / length(A));

out = zeros(length(A(1,:))); %(2x2)
N = length(A(:,1));               % 4

for i = 1:N
    % column vector: A(1,:)
    % row vector: A(1,:)'
    out = out + A(i,:)'*A(i,:) - m'*m;
end

S = out / N;
end