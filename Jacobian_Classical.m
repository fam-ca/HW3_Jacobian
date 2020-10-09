% classical approach, using partial derivatives
function J_Classic = Jacobian_Classical(q1,q2,d3)
syms q1 q2 d3 x y z
syms d1 a2
x = -cos(q2)*sin(q1)*(a2 + d3);
y = cos(q1)*cos(q2)*(a2 + d3);
z = d1 + a2*sin(q2) + d3*sin(q2);
% First joint is revoulte, rotation axis is z, so J(1,3:6)=[0;0;1]
% Second joint is revolute, rotation axis is the plane xy, so J(2,3:6)=[cos(q1);sin(q1);0]
% Third joint is prismatic, translation along y axis, so J(3,3:6)=[zeros(3,1)]
J_Classic = [diff(x,q1) diff(x,q2) diff(x,d3);
    diff(y,q1) diff(y,q2) diff(y,d3);
    diff(z,q1) diff(z,q2) diff(z,d3);
    0 cos(q1) 0;
    0 sin(q1) 0;
    1 0 0;];
J_Classic = simplify(J_Classic);
end