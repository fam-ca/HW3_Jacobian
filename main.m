clear all;

H = FK_(pi/2,0,5);
Q = IK_(0,15,20);

% comparison of all approaches
syms q1 q2 d3
syms d1 a2
J1 = Jacobian_Classical(q1,q2,d3);
J2 = Jacobian_SkewTheory(q1,q2,d3);
J3 = Jacobian_NumDerivatives(q1,q2,d3);
A = J1 - J2;
B = J2 - J3;
C = J1 - J3;
% convert results to double
A = eval(A);
B = eval(B);
C = eval(C);
if isequal(A,zeros(6,3)) && isequal(B,zeros(6,3)) && isequal(C,zeros(6,3))
    disp('Jacobian ok!')
end
