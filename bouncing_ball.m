%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
close all

global kc cc Mr Q

m=5;        
g=9.81;     %重力加速度
kc=1e7;		%
cc=500;      %

t0=0;       %% 積分時間 %%
tf=5;
step=0.01;   %% 積分ステップ間隔 %%
ndat=(1/step)*tf;

% 質量マトリクス %
M=[m 0;
   0 m];

Mr=inv(M);
% 外力マトリクス %
Q=[0 -m*g]';

%% 初期位置 %%
x0=0;
y0=1;
dx0=0.2;
dy0=0.1;

y0=[x0;y0;dx0;dy0];

% 数値積分 %
[t,y]=ode45(@sub_bouncing_ball,[t0:step:tf],y0);

% 時刻歴 %

figure(1)
subplot(4,1,1)
plot(t,y(:,1),'r-')
legend('x')
xlabel('time(sec)')
ylabel('x(m)')
grid on

subplot(4,1,2)
plot(t,y(:,2),'r-')
legend('y')
xlabel('time(sec)')
ylabel('y(m)')
grid on

subplot(4,1,3)
plot(t,y(:,3),'r-')
legend('y')
xlabel('time(sec)')
ylabel('dx(m/s)')
grid on

subplot(4,1,4)
plot(t,y(:,4),'r-')
legend('y')
xlabel('time(sec)')
ylabel('dy(m/s)')
grid on

figure(2)
plot(y(:,1),y(:,2),'r-')
legend('x-y')
xlabel('x(m)')
ylabel('y(m)')
grid on
range=1;
axis([-range,range,-range,range],'square');    %座標軸の設定
 
fname=strcat('bouncing_ball.fig');
saveas(gcf,fname,'fig');
% アニメーション %

n=length(t)

figure(3)
%for i=1:n  %簡易アニメーション
for i=1:length(y(:,1))  %簡易アニメーション    

% plot([始点x,終点x],[始点y,終点y])

 plot( y(i,1),y(i,2), 'ro'); 
axis([-range,range,-range,range],'square');    %座標軸の設定
 grid on; drawnow();
 %if ( i==0.1 ) sleep(1);   %初回は1秒待機
 %else sleep(0.01); endif  %この数値でアニメーション速度を調整
 
end
