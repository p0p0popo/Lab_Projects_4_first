a = imread('cameraman.tif');
lp = butterlp(a,15,1);
aFreq = fftshift(fft2(a));
aFreqLp = aFreq.*lp;
fftshow(aFreq);
fftshow(aFreqLp);
aFreqLpi = ifft2(aFreqLp);
ifftshow(aFreqLpi);