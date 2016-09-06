input = images; % (28x28)x60,000 images
target = labels;% 60,000 x 1 labels

trainFcn = 'trainlm';% using the Levenberg-Marquardt 

%Create a fitting network 
hiddenLayerSize = [5,3];
net = fitnet(hiddenLayerSize, trainFcn);

%This is all training
net.divideParam.trainRatio = 30,000/60,000;
net.divideParam.valRatio = 30,000/60,000;

target = target';% this converts the 60000x1 label sheet to 1x60000
[net,tr] = train(net, input, target);

gensim(net, -1);% generate file to view neural network detail

%Testing the network
test_input = test_images;%10,000 images

test_target = test_labels';%10,000 labels


outputs = net(test_input);
errors = gsubtract(outputs, test_target);
performance = perform(net, test_target, outputs);


view(net);% view the network


