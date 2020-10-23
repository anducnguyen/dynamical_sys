%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
close all

global kc cc Mr Q

m=5;        
g=9.81;     %�d�͉����x
kc=1e7;		%
cc=500;      %

t0=0;       %% �ϕ����� %%
tf=5;
step=0.01;   %% �ϕ��X�e�b�v�Ԋu %%
ndat=(1/step)*tf;

% ���ʃ}�g���N�X %
M=[m 0;
   0 m];

Mr=inv(M);
% �O�̓}�g���N�X %
Q=[0 -m*g]';

%% �����ʒu %%
x0=0;
y0=1;
dx0=0.2;
dy0=0.1;

y0=[x0;y0;dx0;dy0];

% ���l�ϕ� %
[t,y]=ode45(@sub_bouncing_ball,[t0:step:tf],y0);

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
grid on
range=1;
axis([-range,range,-range,range],'square');    %���W���̐ݒ�
 
fname=strcat('bouncing_ball.fig');
saveas(gcf,fname,'fig');
% �A�j���[�V���� %

n=length(t)

figure(3)
%for i=1:n  %�ȈՃA�j���[�V����
for i=1:length(y(:,1))  %�ȈՃA�j���[�V����    

% plot([�n�_x,�I�_x],[�n�_y,�I�_y])

 plot( y(i,1),y(i,2), 'ro'); 
axis([-range,range,-range,range],'square');    %���W���̐ݒ�
 grid on; drawnow();
 %if ( i==0.1 ) sleep(1);   %�����1�b�ҋ@
 %else sleep(0.01); endif  %���̐��l�ŃA�j���[�V�������x�𒲐�
 
end
