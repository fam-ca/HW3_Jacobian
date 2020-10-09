% skew theory
function J_Skew = Jacobian_SkewTheory(q1,q2,d3)
syms q1 q2 d3
syms d1 a2

O_zero = [0; 0; 0];
O_one = [0; 0; d1];
O_three = [-cos(q2)*sin(q1)*(a2 + d3); cos(q1)*cos(q2)*(a2 + d3); d1 + a2*sin(q2) + d3*sin(q2)]; 

Z_zero = [0; 0; 1]; % third column of T00
Z_one = [cos(q1); sin(q1); 0]; % first column of T01
Z_two = [-cos(q2)*sin(q1);  cos(q1)*cos(q2); sin(q2)]; % second column of T02

J1 = [cross(Z_zero,(O_three - O_zero)); Z_zero];
J2 = [cross(Z_one,(O_three - O_one)); Z_one];
J3 = [Z_two; zeros(3,1)];
J_Skew = [simplify(J1) simplify(J2) simplify(J3)];
end