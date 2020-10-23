clear all
global Mr Q
g = 9.81;
j = 10;
m = 2;
M = [m 0 0;0 m 0; 0 0 j];
L = 6;
t0=0;       
tf=3.0;
step=0.005;   
ndat=(1/step)*tf;

Mr = inv(M);
Q = [0 -m*g 0]';
xb0 = 0.1;
yb0 = 1.0;
xdot0 = 1.0;
ydot0 = 1.0;
theta0 = 30/180*pi;
omega0 = 0;

y0 = [xb0;yb0;theta0;xdot0;ydot0;omega0];

[t,y]=ode45(@sub_practice31,[t0:step:tf],y0);


%%

figure(1)

subplot(2,1,1)
plot(t,y(:,3),'r-')
xlabel('time (sec)')
ylabel('\theta (rad)')
grid on
title('Record of angle(\theta) and angular velocity (\omega)')
subplot(2,1,2)
plot(t,y(:,6),'r-')
xlabel('time (sec)')
ylabel('\omega (rad/s)')
grid on


%%
for i = 1:length(y(:,1))
    xb1(i) = y(i,1)-L*cos(y(i,3)/2);
    xb2(i) = y(i,1)+L*cos(y(i,3)/2);
    yb1(i) = y(i,2)-L*sin(y(i,3)/2);
    yb2(i) = y(i,2)+L*sin(y(i,3)/2);
   
    figure(2)
    plot([xb1(i),xb2(i)],[yb1(i),yb2(i)],'linewidth',3);
    axis([-10,50,-70,70],'square'); 
    grid on
%     pause(0.005);
    xlabel('x(m)')
    ylabel('y(m)')
    title('Animation of rotating bar')
    drawnow();
end
%%
figure(3)
plot(sqrt((xb1-xb2).^2+(yb1-yb2).^2)/2)
title('Check the constrain of length L of the bar [L = 6]')
 


