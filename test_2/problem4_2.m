figure
hold on
[x,y] = getCircle([5,5],2);
plot(x,y,'LineWidth',4,'Color','b');
[x,y] = getCircle([9.2,5],2);
plot(x,y,'LineWidth',4,'Color','k');
[x,y] = getCircle([13.4,5],2);
plot(x,y,'LineWidth',4,'Color','r');
[x,y] = getCircle([7,2.5],2);
plot(x,y,'LineWidth',4,'Color','y');
[x,y] = getCircle([11.2,2.5],2);
plot(x,y,'LineWidth',4,'Color','g');
axis equal