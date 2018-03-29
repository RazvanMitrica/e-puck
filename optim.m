function [intrare] = optim(z0,zref,N,dt)
%Argumente functie  z0   -stare initiala     vector(2,1)
%                   zref -stari de referinta vector(2,N)
%                   N    -orizontul de predictie
%                   dt   -pasul de discretizare
r = 0.0412; %raza rotilor
l = 0.0535; %distanta dintre roti

umax = [1024];  %comanda maxima
umin = [-1024]; %comanda minima
Az = eye(2);    
Bu = dt.*[r/2 r/2;r/2/l -r/2/l];
[Q q] = genQq(N,zref);      %generare Q si q
[A b] = genAb(N,Az,Bu,z0);  %generare A si b constrangeri egalitate a.i. Az = b
[C d] = getCd(N,umax,umin); %generare C si d constrangeri inegalitate a.i. 
                            %Cz = d
                            %f = @(x)1/2*x'*Q*x+q'*x;

%opts = optimoptions('quadprog','Display','off');
temp = quadprog(Q,-q,C,d,A,b,[],[],[]);
intrare = temp(1:2);
end