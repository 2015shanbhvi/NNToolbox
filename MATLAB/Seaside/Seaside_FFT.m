signal = importdata('Seaside_vars.mat');
close all
plot(signal);%plot signal
figure()
noise = 0.025*randn(size(signal));%make noise
plot(signal+noise);%add noise
figure()
plot(10*log10(pwelch(signal)));%plot signal welch
hold on
plot(10*log10(pwelch(signal+noise)));%plot noise and signal welch


























% %X = importdata('Seaside_noise_vars.mat');
% 
% Fs= 10000; %Sampling frequency
% T = 1/Fs; %Sampling Period
% L = 400000; %Length of signal
% t = (0:L-1)*T; %Time vector
% 
% % %Signal with 50Hz sin A=0.7 
% % %plus 120Hz sin A=1
% % S = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t);
% % %Add zero-mean noise with variance 4
% % X = S + 2*randn(size(t));
% 
% %Computing the two-sided spectrum P2. 
% %Single=sided spectrum P1, signal length L
% Y = pwelch(X);
% P2 = abs(Y/L);
% P1 = P2(1:L/2+1);
% P1(2:end-1) = 2*P1(2:end-1);
% 
% %Define freq. domain f.
% f = Fs*(0:(L/2))/L;
% plot(f,P1);
% title('Single-Sided Amplitude Spectrum of X(t)');
% xlabel('f (Hz)');
% ylabel('|P1(f)|');