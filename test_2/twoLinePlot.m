figure
t = 0:0.01:2*pi;
y1 = sin(t);
y2 = cos(t);
hold on
xlabel('x');
ylabel('y');
title('sin and cos');
plot(t,y1,'b-');
%plot(t,y1,'b',t,y2,'r');
plot(t,y2,'r-');
legend('sin','cos');
xlim([0 2*pi]);
ylim([-1.4 1.4]);
hold off
