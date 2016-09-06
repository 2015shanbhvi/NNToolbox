net = network;

net.numInputs = 1; %to double 1 number
net.numLayers = 1;% one hidden layer

net.biasConnect(1) = 1;

net.inputConnect(1,1) = 1;


net.inputs{1}.size = 1;


net.layers{1}.transferFcn = 'tansig';

net.outputConnect = [1];

%set initialization function
net.initFcn = 'initlay';
%set peformance function to Mean Squared Error
net.performFcn = 'mse';
%set training function to Levenberg-Marquardt
net.trainFcn = 'trainlm';
%set divide function to divide training data randomly
net.divideFcn = 'dividerand';
%net.plotFcns = {'plotperform', 'plottrainstate'};

X = [0:1:100];
T = X;
for n = 1:101
    T(n) = T(n) * T(n);
end

net = train(net, X, T);
%[net,tr] = train(net, X, T);


%view(net);