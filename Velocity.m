clear all;
close all;

d1 = 15;
a2 = 10;
t = 0:0.1:5;
q1 = sin(t);
q2 = cos(2*t);
d3 = sin(3*t);
q1_dot = diff(q1);
q2_dot = diff(q2);
d3_dot = diff(d3);
q_dot_F = [q1_dot;q2_dot;d3_dot];
v_total = [];
for i=1:length(q1)-1
    
J = [-cos(q1(i))*cos(q2(i))*(a2 + d3(i)) sin(q1(i))*sin(q2(i))*(a2 + d3(i)) -cos(q2(i))*sin(q1(i));
    -cos(q2(i))*sin(q1(i))*(a2 + d3(i)) -cos(q1(i))*sin(q2(i))*(a2 + d3(i)) cos(q1(i))*cos(q2(i));
    0 cos(q2(i))*(a2 + d3(i)) sin(q2(i));
    0 cos(q1(i)) 0;
    0 sin(q1(i)) 0;
    1 0 0];
    Q_dot = [q1_dot(i);q2_dot(i);d3_dot(i)];
    v = J*Q_dot;
    v_total = [v_total v];
end

figure;
plot(t(1:50),v_total(1,:),'r',...
    t(1:50),v_total(2,:),'b',...
    t(1:50),v_total(3,:),'g',...
    t(1:50),v_total(4,:),'--',...
    t(1:50),v_total(5,:),'--',...
    t(1:50),v_total(6,:),'--');

xlabel('Time, sec');
ylabel('Velocity, m/s');
title('Velocity versus time graph');
legend('vx','vy','vz','wx','wy','wz');