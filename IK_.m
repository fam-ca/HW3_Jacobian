function Q = IK_(x,y,z)
% syms q1 q2 d3 x y z
d1 = 20;
a2 = 10;

s = z - d1;
r = sqrt(x^2+y^2);
q11 = pi/2 - atan2(y,x);
q12 = -pi/2 - atan2(y,x);
q21 = atan2(s,r);
q22 = atan2(s,r)+pi;
d3 = sqrt(s^2+r^2)-a2;
if q21 == pi/2
    disp('It''s singularity.');
end
Q = [q11 q21 d3;
    q12 q22 d3];
end