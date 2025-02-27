A=[0.25 0.75 1.25 1.75 2.25 2.75 3.25];
B=[4.29 3.71 3.32 3.03 2.94 2.82 2.75];
n=length(A);
C=zeros(1,n);                                 %matica pre koeficienty newtonovho polynomu
C(1)=B(1);                                    
h=A(2)-A(1);                                  %rozdiel x_1 a x_0
delta=zeros(n);                               %matica pre diferencie
f=zeros(1,n);                                 %vektor pre faktorialy
f(1)=1;
for j=1:n 
  delta(j,1)=B(j);                            %do prveho stlpca matice delta da hodnoty z B
endfor
for k=2:n                                     %nastavi sa v stlpci
  for j=1:n+1-k                               %prechadza cez riadky
    delta(j,k)=delta(j+1,k-1)-delta(j,k-1);   %zapise do matice hodnoty doprednych diferencii
  endfor
  f(k)=f(k-1)*k;                              %zapise do vektora hodnoty faktorialov od 2 po n
endfor
for l=2:n
  C(l)=delta(1,l)./(f(l-1)*h^(l-1));          %zapise zvysne hodnoty koeficientov newtonovho polynomu
endfor
C
p=[1,-A(1)];                                  %hodnoty polynomu (x-x_0)
U=zeros(n);                                   %matica, kde sa budu do riadkov zapisovat koeficienty p vynasobene zistenymi koef C newtonovho polynomu
for i=2:n
  U(i,n-length(p)+1:n)=p*C(i);
  p=conv(p,[1,-A(i)]);                        %conv(a,b) ak a,b predstavuju koef polynomov, funkcia conv mi da koef sucinu tych dvoch polynomov (spocita suciny pri c_i)
endfor
U(1,n)=B(1);
P=sum(U,1)                                    %koeficienty polynomu 

G=polyval(P,A);
plot(A,G,"b",A,B,"o")
title("Z·vislosù y od t")
xlabel("t")
ylabel("y")

% B)
O=rand(1000,1000);

tic
K=zeros(1000,1000);
N=length(P);
for i=1:1000                                  %nastavi sa v riadku
  for j=1:1000                                %nastavi sa v stlpci
    for k=1:N
      K(i,j)=(P(k)*O(i,j)^(N-k))+K(i,j);
    endfor
  endfor
endfor
priama=toc


tic
T=P(1)*ones(1000,1000);
for i=1:1000                                  %nastavi sa v riadku
  for j=1:1000                                %nastavi sa v stlpci
    for k=1:6
     T(i,j)=P(k+1)+T(i,j)*O(i,j);
    endfor
  endfor
endfor
horner=toc

%R=P-c'                                         %c su koeficienty polynomu z 1. zadania zistene metodou najmensich stvorcov
