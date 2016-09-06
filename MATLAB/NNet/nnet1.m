net = network;
inputx = [.1:0.1:1];
inputy = [.1:0.1:1];
% Now make the mesh

%STRUCTURE
net.numInputs = 2;% for x and y
net.numLayers = 1;%one hidden layer

%BIASES
net.biasConnect(1) = 1;

%INPUT CONNECT
%connect 1st input to layer1
net.inputConnect(1,1) = 1;
net.inputConnect(1,2) = 1;

%LAYER CONNECT
%the following command feedsback output
%net.layerConnect = [1];
%connects to output
net.outputConnect = [1];

%INPUTS
%Both inputs go into the hidden layer





view(net);
%gensim(net);
