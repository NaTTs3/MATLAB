a=0;
b=20;               %hranice intervalu
dt=0.02;            %kroky
n=(b-a)/dt+1;       %pocet krokov
g=9.81;
L=2*g;
teta=zeros(1,n);    %Eulerova metoda
omega=zeros(1,n);
teta2=zeros(1,n);   %RK4
omega2=zeros(1,n);
teta(1)=0;          %pociatocne hodnoty v bode t1=a
omega(1)=0.1;         
teta2(1)=0;
omega2(1)=0.1;
t=zeros(1,n);
t(1)=a;
for i=2:n 
    t(i)=t(i-1)+dt;
    
    domega=-(g/L)*teta(i-1);
    dteta=omega(i-1);
    
    k1=-(g/L)*teta2(i-1);
    k2=-(g/L)*(teta2(i-1)+(dt/2)*k1);
    k3=-(g/L)*(teta2(i-1)+(dt/2)*k2);
    k4=-(g/L)*(teta2(i-1)+dt*k3);
    m1=omega2(i-1);
    m2=omega2(i-1)+(dt/2)*m1;
    m3=omega2(i-1)+(dt/2)*m2;
    m4=omega2(i-1)+dt*m3;
    
    teta(i)=teta(i-1)+dteta*dt;                      %Eulerova metoda
    omega(i)=omega(i-1)+domega*dt;
    
    teta2(i)=teta2(i-1)+dt*((m1+2*m2+2*m3+m4)/6);    %RK4
    omega2(i)=omega2(i-1)+dt*((k1+2*k2+2*k3+k4)/6);
end

Z=zeros(1,n);                       %lsode riesenie
function f=fun(teta,t)
  f(1)=-(1/2)*teta(2);
  f(2)=teta(1);
endfunction
Z=lsode("fun",[0.1,0],t);
Z=Z';

figure(1)           %riesenia uhlovej zavislosti roznymi metodami
plot(t,teta)
title("Èasová závislos uhla vychılenia ideálneho kyvadla")
hold on
plot(t,teta2,"r")
plot(t,Z(2,:),"g")
legend({"Eulerova metóda","RK4 metóda","lsode riešenie"})
xlabel("t")
ylabel("Uhol vychılenia")

figure(2)           %riesenia zavislosti uhlovej rıchlosti roznymi metodami
plot(t,omega)
title("Èasová závislos uhlovej rıchlosti ideálneho kyvadla")
hold on
plot(t,omega2,"r")
plot(t,Z(1,:),"g")
legend({"Eulerova metóda","RK4 metóda","lsode riešenie"})
xlabel("t")
ylabel("Uholová rıchlos")

figure(3)
plot(t,abs(Z(2,:)-teta))
hold on
plot(t,abs(Z(2,:)-teta2),"r")
plot(t,abs(teta-teta2),"g")
legend("Eulerová metóda oproti lsode","RK4 metóda oproti lsode","Eulerová metóda oproti RK4 metóde")
title("Rozdiel riešenia uhlovej závislosti medzi jednotlivimi metódami")
xlabel("t")
ylabel("Uhol vychılenia")