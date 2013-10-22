function [A, b, c] = hilbertLP(n)
%Hilbert LP problem of dimension n
% In
% n. - the order of the Matrix
%Out
% A. n X (2*n) Matrix
% b  (n) X 1 vector 
% c  1 X (2*n) vector
%AUTHOR: Yujia Yan

hilberMat= hilb(n);
%%
%fill in the A matrix
A=[hilberMat  eye(n)];

%%
%fill in the b matrix
b=sum(hilberMat)';

%%
%fill in the c matrix
c=[zeros(1, n) ones(1,n)];


