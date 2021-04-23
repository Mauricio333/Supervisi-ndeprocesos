%Seleccionar columnas y graficar
A=dlmread('MatlabMMC.txt');
x=A(:,1);
y=A(:,2);
plot(x,y,'o')

n=numel(x);
xmax=max(x);
xmin=min(x);

%Calculamos la pendiente
sum_x=sum(x);
sum_y=sum(y);
sum_xx=sum(x.*x);
sum_yy=sum(y.*y);
sum_xy=sum(x.*y);
sum_x2=sum_x*sum_x;
sum_y2=sum_y*sum_y;

m=(n*sum_xy - sum_x*sum_y)/(n*sum_xx - sum_x2);
b=(1/n)*(sum_y - m*sum_x);

s=sqrt((sum_yy-sum_y2/n-m*(sum_xy-sum_x*sum_y/n))/(n-2));
e_m=s*sqrt(n/(n*sum_xx-sum_x2));
e_b=s*sqrt(sum_xx/(n*sum_xx-sum_x2));
r=(sum_xy-sum_x*sum_y/n)/sqrt((sum_xx-sum_x2/n)*(sum_yy - sum_y2/n));

%Calculando los coeficientes

xn=linspace(xmin, xmax, 1001);

text3=['R=' num2str(r, '%0.4g')];

yn = m.*xn + b;

text1=['c=' num2str(b, '%0.4g') '   ; e_c = ' num2str(e_b, '%0.2g')];
text2=['m=' num2str(m, '%0.4g') '   ; e_m = ' num2str(e_m, '%0.2g')];

plot(xn,yn,'LineWidth',2,'Color','k');
hold on
scatter(x,y,'o','filled');
text(33,800,'y = mx + c','fontSize',10);
text(33,780,text1,'fontSize',10);
text(33,760,text3,'fontSize',10);
text(33,740,text3,'fontSize',10);


