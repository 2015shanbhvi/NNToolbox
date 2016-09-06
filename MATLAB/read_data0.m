fid = fopen(data0,'r');
[t1,N] = fread(fid,[28 28], uchar); % 28x28 matrix t2 has the first example
imshow(t1);
