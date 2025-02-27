A=[20 40 60 80 100 120]
B=[1.71	2.6	3.24	5.46	6.81	8.42]
n=columns(A)
for i=1 % i èíslo stupòa polynómu
  V=ones(i+1);
  for l=1:i+1 %nastaví sa v riadku
    for j=1:i+1 %prejde všetky ståpce v riadku
      V(j,l)=sum(A.^(j+l-2)); %l suradnica riadka, j suradnica ståpca
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
  title("závislos hodnôt t_i od y_i pre rôzne stupne polynómu")
  xlabel("t_i")
  ylabel("y_i")
  legend()
  hold on
  p=polyfit(A,B,i) %koeficienty
endfor
hold off
%figure
%plot(1:6,D)
%title("závislos súètu najmenších štvorcov od stupòa polynómu")
%xlabel("stupeò polynómu")
%ylabel("D")

