rng default %
hold off
x = 0:100;
signal = cos(pi/3*x)%+randn(size(n));
wsignal = pwelch(signal);
plot(signal);
hold on
plot(wsignal);
hold on
%plot(10*log10(pwelch(signal)));

indexmin = find(min(wsignal) == wsignal);
xmin = x(indexmin);
ymin = wsignal(indexmin);

indexmax = find(max(wsignal) == wsignal);
xmax = x(indexmax);
ymax = wsignal(indexmax);

strmin = ['Minimum =',num2str(ymin), ',   ',num2str(xmin)];
text(xmin,ymin,strmin,'HorizontalAlignment','left');

strmax = ['Maximum = ',num2str(ymax), ',   ',num2str(xmax)];
text(xmax,ymax,strmax,'HorizontalAlignment','right');