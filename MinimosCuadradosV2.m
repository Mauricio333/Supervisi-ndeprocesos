clear 

figure(1)
axis ([-1 1 -1 1])
grid on
hold on
X = linspace (-1,1,1000)';
Dat1 = rand (2,1);
Av = [X ones(size(X))];
Y = Av*Dat1;
h = plot(X, Y);

figure(2)
V = zeros (20,2);
Zo = eye(2)*6000;
lambda = 1;

while(1)
   %%gràfica 1
    figure(1)
    %%input
    [x,y] = ginput(1);
    plot(x,y,'*r','LineWidth',3)
    MATA = [x 2];
    b = y;
    Z1 = 1/lambda*(Zo-(Zo*MATA'*MATA*Zo)/(lambda+MATA*Zo*MATA'));
    Dat = Dat1 + (Z1*MATA')/(1+MATA*Z1*MATA')*(b-MATA*Dat1);
    Zo = Z1; 
 
    V(1:end-1,:) = V(2:end,:);
    V(end,:) = Dat';
    figure(2)
    plot(V)
    Av = [X ones(size(X))];
    Y = Av*Dat;
    delete(h)
    figure(1)
    h = plot(X, Y);
    Dat1 = Dat;
end
    
    