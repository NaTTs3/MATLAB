clear all
f=@(x) x/sqrt(x^4+16);
output_precision(10)
a=0;
b=sqrt(3);
%Lichobeznikova metoda
n=1;
ILstare=0;
ILnove=((b-a)/2)*(f(a)+f(b));
while norm(ILnove-ILstare)>10^(-4)
  ILstare=ILnove;
  n=n+1;
  h=(b-a)/n;
  X=zeros(1,n+1);
  for i=2:n+1
    X(i)=X(i-1)+h;              %vektor, kde sa zapisuju hodnoty x v deleni intervalu
  end
  suma=0;
  for j=2:n
    suma=suma+f(X(j));          %sucet zloziek vektora X od druhej po predposlednú
  end
  ILnove=h/2*(f(X(1))+f(X(n+1))+2*suma);
end
deleniaL=n
ILnove
%Simpsonova metoda
n=2;
ISstare=0;
ISnove=((b-a)/6)*(f(a)+4*f((a+b)/2)+f(b));
while norm(ISnove-ISstare)>10^(-4)
  ISstare=ISnove;
  n=n+2;
  h=(b-a)/n;
  X=zeros(1,n+1);
  for i=2:n+1
    X(i)=X(i-1)+h;                %vektor, kde sa zapisuju hodnoty x v deleni intervalu
  end
  suma1=0;
  for j=2:2:n
    suma1=suma1+f(X(j));          %sucet parnych zloziek vektora X
  end
  suma2=0;
  for k=3:2:n-1
    suma2=suma2+f(X(k));          %sucet neparnych zloziek vektora X
  end
  ISnove=h/3*(f(X(1))+f(X(n+1))+4*suma1+2*suma2);
end
deleniaS=n/2
ISnove
%Vypocet pomocou trapz a quadv
xt=linspace(a,b,300);
y=xt./sqrt(xt.^4+16);
trapz=trapz(xt,y)
quadv=quadv(f, a, b, 10^(-4))