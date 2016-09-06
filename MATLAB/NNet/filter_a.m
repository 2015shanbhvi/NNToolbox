Fs = 500;% sample rate in Hz
N = 500;% number of signal samples
rng default;
x = ecg(N)'+0.25*randn(N,1);% noisy waveform
t = (0:N-1)/Fs;% time vector

%Design a 70th order low pass FIR filter with 75Hz cutoff freq
Fnorm = 100/(Fs/2);
df = designfilt('lowpassfir','FilterOrder', 70, 'CutoffFrequency', Fnorm);

%Plot the group delay filter
grpdelay(df,2048,Fs); % plot group delay
D = mean(grpdelay(df)); %filter delay in samples

y = filter(df,[x; zeros(D,1)]); % Append D zeros to the input data
y = y(D+1:end); % shift data to compensate for delay

figure
plot(t,x,t,y,'r','linewidth', 1.5);
title('Filtered Waveforms');
xlabel('Time (s)');
legend('Original Noisy Signal','Filtered Signal');
grind on
axis tight