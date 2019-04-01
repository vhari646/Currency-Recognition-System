function [BW,maskedRGBImage] = Mask(RGB)
I = rgb2hsv(RGB);
figure;imshow(I,[]),title('hsv color space')
channel1Min = 0.0;%0.203
channel1Max = 1.000;
channel2Min = 0.053;%0.053
channel2Max = 1.000;
channel3Min = 0.0;%0.2
channel3Max = 1.000;
BW = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
	 (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
	 (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
maskedRGBImage = RGB;
maskedRGBImage(repmat(~BW,[1 1 3])) = 0;
end