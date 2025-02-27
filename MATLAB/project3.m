x0=1;
xstare=x0;
xnove=xstare-mojaf(xstare)/derivacia(xstare);
it=1;                                          %poèet iteracii
while (norm(xnove-xstare)>10^-7)
  it=it+1;
  xstare=xnove;
  xnove=xstare-mojaf(xstare)/derivacia(xstare);
end
output_precision(15)
xnove
it

x=fsolve(@mojaf,x0)

function [y]=mojaf(x)
  y=sin(2*x)+cos(x)-x;
end

function a=derivacia(x)
  a=2*cos(2*x)-sin(x)-1;
end