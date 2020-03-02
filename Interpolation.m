T = sig(:,1);
X = sig(:,2);

figure(1)
clf
plot(X,T,'o')
title('Raw Ricardo Output')
ylabel('Manifold Air Pressure [kPa]')
xlabel('Throttle Position [%]')

f1=fit(X,T,'pchip')
f2=fit(X,T,'cubicinterp')
f3=fit(X,T,'linearinterp')
figure(2)
clf
hold on
plot(X,T,'o')
plot(f1,X,T,'r')
plot(f2,X,T,'--b')
plot(f3,X,T,'-g')
hold off
legend('Raw','PCHIP','Cubic Interpolation','Linear Interpolation')

title('Fit Comparison')
ylabel('Manifold Air Pressure [kPa]')
xlabel('Throttle Position [%]')
