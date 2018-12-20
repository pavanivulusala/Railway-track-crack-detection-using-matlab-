#matlab code
I=imread('two.jpg');
figure,imshow(I)
title('Original image')
Istrech = imadjust(I,stretchlim(I));
figure,imshow(Istrech)
title('Contrast stretched image')
Igray_s = rgb2gray(Istrech);
figure,imshow(Igray_s,[])
title('RGB to gray (contrast stretched) ')
level = 0.08;
Ithres = im2bw(Igray_h,level);
figure,imshow(Ithres)
title('Segmented cracks')
BW = bwmorph(gradmag,'clean',10);
figure,imshow(BW)
title('Cleaned image')
BW = bwmorph(gradmag,'thin', inf);
figure,imshow(BW)
title('Thinned image')
BW = imfill(gradmag, 'holes')
figure,imshow(BW)
title('Filled image')
figure,imtool(BW1)
figure,imtool(I)
calibration_length=0.001;
calibration_pixels=1000;
crack_pixel=35;
crack_length=(crack_pixel *calibration_length)/calibration
print crack_length
