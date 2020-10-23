clear all 
close all
global Mr Q
g = 9.81;
j = 10;
m = 2;
M = [m 0 0;0 m 0; 0 0 j];
L = 6;
t0=0;       
tf=2.0;
step=0.005;   
ndat=(1/step)*tf;   

Mr = inv(M);
Q = [0 0 0]';
xb0 = 0;
yb0 = 0;
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
    xb1(i) = y(i,1);
    xb2(i) = y(i,1)+L*cos(y(i,3));
    yb1(i) = y(i,2);
    yb2(i) = y(i,2)+L*sin(y(i,3));
   
    figure(2)
    plot([xb1(i),xb2(i)],[yb1(i),yb2(i)],'linewidth',2);
    axis([0,100,0,100]); 
    grid on
%     pause(0.005);
    xlabel('x(m)')
    ylabel('y(m)')
    title('Animation of rotating bar')
    %plot(xb2(i),yb2(i),'.');
    drawnow();  
end
%%
figure(3)
plot(sqrt((xb1-xb2).^2+(yb1-yb2).^2))
title('Check the constrain of length L of the bar [L = 6]')
 


