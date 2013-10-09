function [A, b, c] = KleeMinty(n)
% Klee-Minty LP problem of dimension n
% In
% n. - natural number greater than 2.
% Out
% A. - n x (2*n) matrix
% b.-(n) X 1 vector such that b(i) = 5^i, i=1:n
% c.- 1 X (2*n)  vector such that c(i) = 2^(n-i), i=1:n.
% 	- c( n+1: 2*n) =zeros(1,n).
% c SHOULD BE A ROW VECTOR
% AUTHOR: Yujia Yan

%%
%fill in the A matrix
p= 2.^ [1:n];
A= tril(p'* fliplr(p))/2^n -eye(n) ;
A=[A eye(n)];

%%
%fill in the b matrix
b= 5.^[1:n]';

%%
%fill in the c matrix
c= -[2.^(n-1:-1:0) zeros(1, n)];

end

