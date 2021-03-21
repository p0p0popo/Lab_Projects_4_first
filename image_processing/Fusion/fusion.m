image1 = imread('ct.jpg');
image2 = imread('mri.jpg');

image1 = double(image1);
image2 = double(image2);

fusedImage = imadd(image1,image2)./2;       % Weighted-pixel averaging

subplot(1,3,1);
imshow(image1/255,[ ]);

subplot(1,3,2);
imshow(image2/255,[ ]);

subplot(1,3,3);
imshow(fusedImage/255,[ ]);