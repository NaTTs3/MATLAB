a=1;
b=10;              %hranice intervalu
dx=0.1;           %kroky
n=(b-a)/dx+1;      %pocet krokov
y=zeros(1,n);      %Riesenia Eulerovou metodou
z=zeros(1,n);      %Riesenia Heuneho metodou
Y=zeros(1,n);      %Presne riesenie
y(1)=1;            %hodnota v prvom bode x1=a
z(1)=1;
x=zeros(1,n);
x(1)=a;
for i=2:n 
    x(i)=x(i-1)+dx;
    dy=x(i-1)/((y(i-1))^3);
    k1=x(i-1)/((z(i-1))^3);
    k2=x(i)/((z(i-1)+dx*k1)^3);
    y(i)=y(i-1)+dy*dx;
    z(i)=z(i-1)+dx*(k1+k2)/2;
    Y(i-1)=(2*(x(i-1)^2)-1)^(1/4);
end
Y(n)=(2*(x(n)^2)-1)^(1/4);

function f=fun(y,x)  %lsode riesenie
  f=x./(y.^3);
endfunction
Z=lsode("fun",1,x);
Z=Z';

figure(1)
plot(x,y)            %graf rieseni
hold on
plot(x,z,'y')
plot(x,Y,'g')
plot(x,Z,'c')
legend({"Eulerova metóda","Heuneho metóda","Presné riešenie","lsode riešenie"},"location","northwest");
xlabel("x")
ylabel("y")
title("Riešenie diferenciálnej rovnice")

figure(2)            %graf chyby porovnanie s presnym
plot(x,abs(y-Y),'b')
hold on
plot(x,abs(z-Y),'r')
legend ("Eulerova metóda","Heuneho metóda");
xlabel("x")
ylabel("y")
title("Graf závislosti chýb jednotlivých numerických metód vzh¾adom na presné riešenie s krokom 0.01")

figure(3)            %graf chyby lsode od presneho
plot(x,abs(Z-Y))
xlabel("x")
ylabel("y")
title("Graf závislosti chýb numerického riešenia pomocou funkcie lsode vzh¾adom na presné riešenie")
