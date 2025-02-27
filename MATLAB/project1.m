A=[20 40 60 80 100 120]
B=[1.71	2.6	3.24	5.46	6.81	8.42]
n=columns(A)
for i=1 % i ��slo stup�a polyn�mu
  V=ones(i+1);
  for l=1:i+1 %nastav� sa v riadku
    for j=1:i+1 %prejde v�etky st�pce v riadku
      V(j,l)=sum(A.^(j+l-2)); %l suradnica riadka, j suradnica st�pca
    endfor
  endfor
  V(1,1)=n;
  Y=ones(i+1,1);
  for k=1:i+1
    Y(k)=sum(B.*A.^(k-1));  
  endfor
  c=V\Y;
  c=flip(c) %koeficienty
  G=polyval(c,A); 
  D(i)=sum((B-G).^2)
  plot(A,G)
  title("z�vislos� hodn�t t_i od y_i pre r�zne stupne polyn�mu")
  xlabel("t_i")
  ylabel("y_i")
  legend()
  hold on
  p=polyfit(A,B,i) %koeficienty
endfor
hold off
%figure
%plot(1:6,D)
%title("z�vislos� s��tu najmen��ch �tvorcov od stup�a polyn�mu")
%xlabel("stupe� polyn�mu")
%ylabel("D")

