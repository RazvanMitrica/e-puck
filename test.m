%initializare constante si matrice de rotatie
R = @(teta)[cos(teta),sin(teta),0;-sin(teta),cos(teta),0;0,0,1];
i=0;
delay = 0.2;
r = 0.0412;
l = 0.0535;
k=1;
t=0;
timp_oprire = 10;
N = 20;
%initializare parametrii robot
epic = reset(epic,'odom');
epic = updateDef(epic, 'pos',1);
epic = updateDef(epic, 'odom',1);
epic = set(epic, 'speed', [0 0]);
epic = update(epic);

%initializare referinta in coordonatele de stare [x;theta]
zref = @(t)[t/10;pi/4];

%epic = set(epic,'odom',[0 0 pi/3.9]);%optional puncte initiale in
%coordonatele [x y theta]
%epic = update(epic);

%%%%%%%
while t<timp_oprire
    tic
    
    epic = updateOdometry(epic);%actualizare parametrii odometru
    aux = get(epic,'odom');     %citire parametrii de odometrie
    
    stare = R(aux(3))\aux';     %calculare stare la momentul actual t0 in
                                %coordonatele [x;theta]
    for i = 1:N                     %calculez zreferinta pentru urmatoarele
        ref(:,i) = zref(t+i*delay); %N momente de timp
    end
    
    u = optim([stare(1);stare(3)],ref,N,delay);%calculez intrarea u0
    epic = set(epic, 'speed', u');      %setez intrarea robotului
    epic = update(epic);                %timit setarea robotului
    t = t + delay;                      %incrementez timpul
    %salvare u0, z0, si zref pentru plot
    intrari(:,k)= u;
    mas(:,k) = aux';
    z = ref(:,1);
    referinte(:,k) = R(z(2))*[z(1);0;z(2)];
    k= k+1;
    
    dt = toc;
    pause(delay-dt)
end
%%%%%%


mas;
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
