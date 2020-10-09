function J = Jacobian_Computation(q1,q2,d3)
a2 = 10;
d1 = 20;
J = [-cos(q1)*cos(q2)*(a2 + d3) sin(q1)*sin(q2)*(a2 + d3) -cos(q2)*sin(q1);
    -cos(q2)*sin(q1)*(a2 + d3) -cos(q1)*sin(q2)*(a2 + d3) cos(q1)*cos(q2);
    0 cos(q2)*(a2 + d3) sin(q2);
    0 cos(q1) 0;
    0 sin(q1) 0;
    1 0 0];
if rank(J)<3
   disp('Singular') 
end
end