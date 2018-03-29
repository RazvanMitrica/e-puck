function [ C,d ] = getCd(N, umax, umin )
d = zeros(4*N,1);
for i = 1:4:4*N-3
        d(i,1) = umax;
        d(i+1,1) = umax;
        d(i+2,1) = -umin;
        d(i+3,1) = -umin;
end
k=1;
C = zeros(4*N);
for i = 1:4:4*N
    C(i:i+1,k:k+1) = eye(2);
    C(i+2:i+3,k:k+1) = -eye(2);
    k = k+4;
end
end

