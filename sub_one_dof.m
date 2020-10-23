%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% functionprogram: 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function xdot=sub_one_dof(t,y)
global k c Mr Q

% 速度ベクトル %
dq=[y(3);y(4)]

F=[-k*y(1)-c*y(3);
   -k*y(2)-c*y(4)];
Fall=F+Q;

ddq=Mr*F;

xdot=[dq;ddq];
