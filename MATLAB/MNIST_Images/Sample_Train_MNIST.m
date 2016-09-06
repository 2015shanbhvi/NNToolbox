input = sample_images; % (28x28)x60,000 images
target = sample_labels;% 60,000 x 1 labels

trainFcn = 'trainlm';% using the Levenberg-Marquardt 

%Create a fitting network 
hiddenLayerSize = 1;
net = fitnet(hiddenLayerSize, trainFcn);

%This is all training
net.divideParam.trainRatio = 2/3;
net.divideParam.valRatio = 1/3;

target = target';% this converts the 60000x1 label sheet to 1x60000
[net,tr] = train(net, input, target);

%gensim(net, -1);% generate file to view neural network detail



view(net);% view the network


