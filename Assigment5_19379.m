clc;
clear;

T = 1;
t = 0:0.1:15;
Kp = 10;
Kd = [1,3,5,7,9];

num = [T];
den = [T T/16 1];
sys = tf(num,den)

C1 = tf([Kd(1) Kp],[1]);
C2 = tf([Kd(2) Kp],[1]);
C3 = tf([Kd(3) Kp],[1]);
C4 = tf([Kd(4) Kp],[1]);
C5 = tf([Kd(5) Kp],[1]);

complete1 = feedback(sys*C1,1);
complete2 = feedback(sys*C2,1);
complete3 = feedback(sys*C3,1);
complete4 = feedback(sys*C4,1);
complete5 = feedback(sys*C5,1);

figure(1);
hold all;
step(complete1);
step(complete2);
step(complete3);
step(complete4);
step(complete5);
hold off;

com1 = stepinfo(complete1);
com2 = stepinfo(complete2);
com3 = stepinfo(complete3);
com4 = stepinfo(complete4);
com5 = stepinfo(complete5);

[y,u] = step(complete5); % Calculate Steady-State error
sse = abs(1 - y(end))

figure(2);
hold all;
impulse(complete1);
impulse(complete2);
impulse(complete3);
impulse(complete4);
impulse(complete5);
hold off;

figure(3);
hold all;
lsim(complete1,t,t);
lsim(complete2,t,t);
lsim(complete3,t,t);
lsim(complete4,t,t);
lsim(complete5,t,t);
hold off;