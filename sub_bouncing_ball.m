%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% functionprogram: bouncing_ball
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function xdot=sub_bouncing_ball(t,y)
global kc cc Mr Q

% 速度ベクトル %
dq=[y(3);y(4)];

Fcont=[0.0;0.0];

if y(2)<0.0
    Fcont=[0.0;-kc*y(2)-cc*y(4)];
end

ddq=Mr*(Q+Fcont);

xdot=[dq;ddq];
