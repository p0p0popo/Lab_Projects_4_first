rgb_image=imread('peppers.png');
subplot(1,3,1)
imshow(rgb_image)
title('color image')
gray_image=0.2989 * rgb_image(:,:,1) + 0.5870 * rgb_image(:,:,2) + 0.1140 * rgb_image(:,:,3); 
subplot(1,3,2)
imshow(gray_image)
title('Equation grayscale')
gray_image_2=rgb2gray(rgb_image);
subplot(1,3,3)
imshow(gray_image_2);
title('Buit-in grayscale');
