%simulation of mass and mass point example
x = [0; 0; 0; 0; 0; 0]; % [x1, x2, x3, x1', x2', x3']
t=0:0.01:10;

[t,x]=ode45('ProjectAStateSpaceData',t,x);

subplot(311)
plot(t,x(:,1),'r',t,x(:,2),'k');
xlabel('t [s]');ylabel('s,v');
title('Position and velocity for m1 ')
legend('s1','v1')

subplot(312)
plot(t,x(:,3),'r',t,x(:,4),'k');
xlabel('t [s]');ylabel('s');
title('Position and velocity for m2')
legend('s2','v2')

subplot(313)
plot(t,x(:,5),'r',t,x(:,6),'k');
xlabel('t [s]');ylabel('s');
title('Position and velocity for m3')
legend('s3','v3')
