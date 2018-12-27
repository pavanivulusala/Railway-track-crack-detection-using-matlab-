
%% load image
I=imread('three1.jpg');
figure(1),imshow(I)
title('Original image')
%% Image adjust 
Istrech = imadjust(I,stretchlim(I));
figure(2),imshow(Istrech)
title('Contrast stretched image')
%K = medfilt2(Istrech);
%figure(3),imshow(K)
%% Convert RGB image to gray
Igray_s = rgb2gray(Istrech);
figure(3),imshow(Igray_s,[])
title('RGB to gray (contrast stretched) ')
%% Apply median filter to smoothen the image
K = medfilt2(Igray_s);
figure(4),imshow(K)
title('median filter')
se = strel('disk', 4);
%% Apply bot-hat and display 
bothatimg = imbothat(K, se);
figure(5), imshow(bothatimg);
title('bot hat')
%% Binarize the image
BW = imbinarize(bothatimg,0.07);
figure(6),imshow(BW);
title('binary image')
%% Noise removal
BW2 = bwareaopen(BW,1000)
figure(7),imshow(BW2);
title('Noise reduction')
%% Thinning of image
BW4 = bwmorph(BW2,'skel',Inf);
figure(11),imshow(BW4)
title('Thinned image(Skeleton)')
%% Calculation of length
measurements = regionprops(BW4, 'Area');
allCrackLengths = [measurements.Area];
Total_Length=sum(allCrackLengths);
disp(Total_Length);
h = imdistline;
impixelinfo;
imtool(BW4)

