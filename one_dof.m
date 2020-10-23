%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% filename: one_dof.m  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
close all

global k c Mr Q

m=5;        
g=9.81;     %�d�͉����x
k=1e4;		% N/m
c=10        % Ns/m

t0=0;       %% �ϕ����� %%
tf=1.0;
step=0.005;   %% �ϕ��X�e�b�v�Ԋu %%
ndat=(1/step)*tf;

% ���ʃ}�g���N�X %
M=[m 0;
   0 m];

Mr=inv(M);
% �O�̓}�g���N�X %
Q=[0 -m*g]';

%% �����ʒu %%
x0=0.01;
y0=0.01;
dx0=-0.2;
dy0=0.2;

y0=[x0;y0;dx0;dy0];

% ���l�ϕ� %
[t,y]=ode45(@sub_one_dof,[t0:step:tf],y0);

% ������ %

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
 range=0.01;
 axis([-range,range,-range,range],'square');    %���W���̐ݒ�
grid on

fname=strcat('bouncing_ball.fig');
saveas(gcf,fname,'fig');
% �A�j���[�V���� %

n=length(t)

figure(3)
%for i=1:n  %�ȈՃA�j���[�V����
for i=1:length(y(:,1))  %�ȈՃA�j���[�V����    



 plot( y(i,1),y(i,2), 'ro'); 
 range=0.01;
 axis([-range,range,-range,range],'linewidth',4);    %���W���̐ݒ�
 grid on; drawnow();
 
 
end
