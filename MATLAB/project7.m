clear
b=0.0001;
alfa=1;           % alfa=b*dt/(dx^2)
N=5;                % pocet deleni t=(0,2000)
dt=2000/(N-1);      % casova diferencia 
dx=sqrt(b*dt/alfa);  % priestorova diferencia
M=round(3.5/dx);     % pocet deleni x=(0,3.5)
T=zeros(N,M);        % matica rieseni
x=linspace(0,3.5,M);
t=linspace(0,2000,N);
% pociatocne podm
for i=1:M
    T(1,i)=20*cos(2*pi*x(i)/5);
end
for i=1:N
    T(i,1)=30*tanh(0.005*t(i))+20;
end
T(:,M)=20;
%vypocet ostatnych hodnot
for i=2:N
    for j=2:(M-1)
        T(i,j)=alfa*T(i-1)+(1-2*alfa)*T(i-1,j)+alfa*T(i-1,j+1);
    end
end

surface(x,t,T)
