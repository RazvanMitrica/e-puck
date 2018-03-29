function [Q,q] = genQq(m,zref)
    Q = [];
    uref = 100;
    for i = 1:2*m
        Q = blkdiag(Q,eye(2));
    end
    for i = 1:4:4*m-3
        Q(i,:)=   0.00001*Q(i,:);
        Q(i+1,:)= 0.00001*Q(i+1,:);
         Q(i+2,:)= 1*Q(i+2,:);
         Q(i+3,:)= 1*Q(i+3,:);
    end
    q = 0*ones(2*m,1);
    k=1;
    for i=3:4:4*m-1
        q(i) = zref(1,k);
        q(i+1) = zref(2,k);
        k = k + 1;
    end
%     k=1;
%     for i=1:4:4*m-1
%         q(i) = uref(1,k);
%         q(i+1) = uref(2,k);
%         k = k + 1;
%     end
end