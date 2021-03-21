a = imread('trees.tif');
im = im2double(a);
fftlog = fft2(log(im+0.01));
f = butterhp(im,15,1);
c = fftlog.*f;
h = real(ifft2(c));
imshow(h);
h1 = exp(h);
ifftshow(h1);
