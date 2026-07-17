function dx=ProjectAStateSpaceData(t,x)
f=0.15;
m1=0.2;
m2=0.15;
m3=0.1;
k1=8;
k2=6;
k3=6;
k4=5;
b1=0.25;
b2=0.15;
g=9.81;

% System Matrix (A)
A = [0 1 0 0 0 0;
    -(k1 + k2)/m1 -b1/m1 k2/m1 0 0 0;
     0 0 0 1 0 0;
     k2/m2 0 -(k2 + k3)/m2 0 k3/m2 0;
     0 0 0 0 0 1;
     0 0 k3/m3 0 -(k3 + k4)/m3 -b2/m3];

% Input Matrix (B)
B = [0;
     0;
     0;
     1/m2;
     0;
     0];

dx=A*x+B*f;
