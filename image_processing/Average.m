i = imread('cameraman.tif');
f = ones(3,3)/9;
i1 = filter2(f,i,'same');
imshow(i);
figure, imshow(i1/255);
f1 = fspecial('average',[3,3]); % returns an averaging filter h of size hsize.
i2 = filter2(f1,i);
figure, imshow(i2/255);
i3 = filter2(f1,i,'valid');
figure, imshow(i3/255);
i4 = filter2(f1,i,'full');
figure, imshow(i4/255);