clear
f=@(x) asin(x)./x;              %definicia funkcie

figure(1)                       %graf funkcie
plot(linspace(0,1),f(linspace(0,1)))

M=[10 100 1000 10000 100000];   %pocet generovanych bodov
Nseed=100;                      %pocet iteacii

for i=1:length(M)
    for k=1:Nseed
        rand("seed",k)
        clear dole hore
        for j=1:M(i)
            x_n=rand(1);       %generuje nahodne cisla v (0,1)
            y_n=2*rand(1);     %generuje nahodne cisla v (0,2)
            fx_n=f(x_n);       %hodnota v nahodnom cisle x_n
            if y_n<fx_n        %rozdeli body pod a nad krivkou
                dole(j,1)=x_n;
                dole(j,2)=y_n;
            else
                hore(j,1)=x_n;
                hore(j,2)=y_n;
            end
        end
        clear dole2 hore2
        dole2(:,1)=nonzeros(dole(:,1));     %odstrani nulove hodnoty
        dole2(:,2)=nonzeros(dole(:,2));
        hore2(:,1)=nonzeros(hore(:,1));
        hore2(:,2)=nonzeros(hore(:,2));
        I(k)=length(dole2)/M(i)*2;
    end
    I_str(i)=mean(I);                       %stredna hodnota I
    sigma(i)=sqrt(mean((I-mean(I)).^2));    %standardna odchylka
    figure(i+1)                             %grafy generovanych nahodnych bodov
    plot(dole2(:,1),dole2(:,2),'ro')
    hold on
    plot(hore2(:,1),hore2(:,2),'bo')
    hold off
end
figure(7)           %zavislost strednej hodnoty integralu a jej standardnej odchylkz od poctu bodov
plot(log10(M),I_str)
figure(8)
plot(log10(M),sigma)
figure(9)
plot(log10(M),log10(sigma))
hold on 
plot(linspace(1,5),-0.5.*linspace(1,5))
