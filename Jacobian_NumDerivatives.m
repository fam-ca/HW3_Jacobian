% numerical derivatives
function J_Num = Jacobian_NumDerivatives(q1,q2,d3)
syms q1 q2 d3
syms d1 a2
H = simplify(Rz(q1)*Tz(d1)*Rx(q2)*Ty(a2)*Ty(d3));
% rotation matrix
R = H(1:3,1:3);
% diff H by q1
H1 = Rzd(q1)*Tz(d1)*Rx(q2)*Ty(a2)*Ty(d3)*[R^(-1) zeros(3,1); 0 0 0 1];
% extract elements from Hdq1 and get first column of Jacobian matrix
J1 = [H1(1:3,4); H1(3,2); H1(1,3); H1(2,1)];
% diff H by q2
H2 = Rz(q1)*Tz(d1)*Rxd(q2)*Ty(a2)*Ty(d3)*[R^(-1) zeros(3,1); 0 0 0 1];
% extract elements from Hdq2 and get second column of Jacobian matrix
J2 = [H2(1:3,4); H2(3,2); H2(1,3); H2(2,1)];
% diff H by q3
H3 = Rz(q1)*Tz(d1)*Rx(q2)*Ty(a2)*Tyd(d3)*[R^(-1) zeros(3,1); 0 0 0 1];
% extract elements from Hdq3 and get third column of Jacobian matrix
J3 = [H3(1:3,4); H3(3,2); H3(1,3); H3(2,1)];
J_Num = [simplify(J1) simplify(J2) simplify(J3)];
end