function [A,b] = genAb(m,Az,Bu,z0)
A = zeros(2*m,4*m);
% A(1:2,1:2) = -Bu;
% A(1:2,3:4) = eye(2);
k=3;
for i = 3:2:2*m-1
       A(i:i+1,k:k+1) = -Az;
       A(i:i+1,k+2:k+3) = -Bu;
       A(i:i+1,k+4:k+5) = eye(2);
       k = k+4;
end
A(1:2,1:2) = -Bu;
A(1:2,3:4) = eye(2);
A(1:2,5:6) = zeros(2);
b = [Az*z0;zeros(2*m-2,1)];
end

