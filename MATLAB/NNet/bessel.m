% t = 0:0.1:20;
% y = besselj(1,t);
% plot(t,y)
% grid
% xlabel('time in secs');
% ylabel('y');
% title('First order bessel function');

P = t;
T = y;
%Define network. 
net = newff([0 20],[10,1],{'tansig','purelin'},'trainlm');

%Define parameters
net.trainParam.show = 50;
net.trainParam.lr = 0.05;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-4;

%Train network
net1 = train(net, P, T);

%Simulate result
a = sim(net1, P);


%Plot result and compare
plot(P,a,P,a-T);

xlabel('time in secs');
ylabel('Network output and error');
title('First order bessel function');
grid