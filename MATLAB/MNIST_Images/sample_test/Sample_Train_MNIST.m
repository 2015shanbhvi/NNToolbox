input = sample_images; % (28x28)x60,000 images
target = sample_labels;% 60,000 x 1 labels

trainFcn = 'trainlm';% using the Levenberg-Marquardt 

%Create a fitting network 
hiddenLayerSize = [2];
net = fitnet(hiddenLayerSize, trainFcn);

%This is all training
net.divideParam.trainRatio = 3/4; 
net.divideParam.valRatio = 1/4;

target = target';% this converts the 60000x1 label sheet to 1x60000
[net,tr] = train(net, input, target);

%gensim(net, -1);% generate file to view neural network detail

%Testing the network
% test_input = test_images;%10,000 images
% 
% test_target = test_labels';%10,000 labels
% 
% 
% outputs = net(test_input);
% errors = gsubtract(outputs, test_target);
% performance = perform(net, test_target, outputs);


view(net);% view the network


