%initializare constante si matrice de rotatie
R = @(teta)[cos(teta),sin(teta),0;-sin(teta),cos(teta),0;0,0,1];
i=0;
delay = 0.2;
r = 0.0412;
l = 0.0535;
k=1;
t=0;
timp_oprire = 10;
N = 2;

%initializare referinta in coordonatele de stare [x;theta]


zref = @(t)[sqrt(t^2+sin(t)^2);atan(sin(t)/t)];

%stare initiala, la momentul t = 0
stare = [0;0];

%%%%%
while t<timp_oprire
    tic
    
    for i = 1:N
        ref(:,i) = zref(t+i*delay);
    end
    u = optim([stare(1);stare(2)],ref,N,delay);
    stare(1) = stare(1) + delay*r/2.*(u(1)+u(2));
    stare(2) = stare(2) + delay*r/2/l.*(u(1)-u(2));

    t = t + delay;
    
    intrari(:,k)= u;
    mas(:,k) = R(stare(2))*[stare(1);0;stare(2)];
    z = ref(:,1);
    referinte(:,k) = R(z(2))*[z(1);0;z(2)];
    k= k+1;
    
    dt = toc;
    sum = sum + dt;
end

%%%%%
hold off
figure(1)
hold off
plot(referinte(1,:),referinte(2,:),'r*')
hold on
plot(mas(1,:),mas(2,:));
figure(2)
hold off
plot(mas(3,:));
hold on
plot(referinte(3,:),'r*');
figure(3)
hold off
plot(intrari(1,:));
hold on
plot(intrari(2,:));
%hold on

