net = network;
%http://www.mathworks.com/help/nnet/ug/create-and-train-custom-neural-network-architectures.html?requestedDomain=www.mathworks.com

%STRUCTURE======================================================
net.numInputs = 2;%two input sources
net.numLayers = 3;%3 layers between input and output layers.

%BIASES
net.biasConnect(1) = 1;
net.biasConnect(3) = 1;

%INPUT CONNECT=================================================
%to 1st and 2nd layers
net.inputConnect(1,1) = 1;%1st input to layer 1
net.inputConnect(2,1) = 1;%1st input to layer 2
net.inputConnect(2,2) = 1;%2nd input to layer 2

%LAYER CONNECT===============================================
%1,2,3 to layer 3
net.layerConnect = [0 0 0; 0 0 0; 1 1 1];
net.outputConnect = [0 1 1];%connect layer 2 and 3 to output
%this automatically creates two outputs.


%INPUTS========================================================
%First input has two elements, each from 0 to 10
%Second input has five elements, each -2 to 2.

%Configure the inputs
net.inputs{1}.exampleInput = [0 10 5; 0 3 10];
%Set the second input vector to range from -2 to 2
net.inputs{1}.processFcns = {'removeconstantrows','mapminmax'};
%Set the second input to size 5
net.inputs{2}.size = 5;

%LAYERS======================================================
%Changing the first layer's size, transfer fcn, and init. fcn
net.layers{1}.size = 4;
net.layers{1}.transferFcn = 'tansig';
net.layers{1}.initFcn = 'initnw';

%Initialize second layer's size, transfer fcn, init. fcn
net.layers{2}.size = 3;
net.layers{2}.transferFcn = 'logsig';
net.layers{2}.initFcn = 'initnw';

%Initialize the third layer's init. function.
%since all other's are default correct
%So the 3rd output should be size 0????????
net.layers{3}.initFcn = 'initnw';

%WEIGHTS=====================================================
%change weight to 1st input to 2nd layer
net.inputWeights{2,1}.delays =  [0 1];
%change weight to 2nd input to 2nd layer
net.inputWeights{2,2}.delays = 1;
%change weight to 3rd input to 3rd layer
net.layerWeights{3,3}.delays = 1;

%NETWORK FUNCTIONS============================================
%set initialization function
net.initFcn = 'initlay';
%set peformance function to Mean Squared Error
net.performFcn = 'mse';
%set training function to Levenberg-Marquardt
net.trainFcn = 'trainlm';
%set divide function to divide training data randomly
net.divideFcn = 'dividerand';
%set hte plot functions
net.plotFcns = {'plotperform', 'plottrainstate'};

%INITIALIZATION
%this should change the network's biases and weights
net = init(net);

%TRAINING
%Two input vectors
X = {[0;0] [2;0.5]; [2; -2; 1; 0; 1] [-1; -1; 1; 0; 1]};
%Target sequence for second layer, which has three neurons
%and the third layer with one neuron
T = {[1; 1; 1] [0; 0; 0]; 1 -1};

net = train(net,X,T);


%View the network in detail
view(net);
%gensim(net);




