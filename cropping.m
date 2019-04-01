function croppedImage=cropping(rgbImage)  
I = rgb2hsv(rgbImage);
% nBins=256;
% figure
% imhist(I(:,:,1), nBins);title('R');
% figure
% imhist(I(:,:,2), nBins);title('g');
% figure
% imhist(I(:,:,3), nBins);title('b');
%imshow(rgbImage, []);
[mask, maskedRGBImage] = Mask(rgbImage);
mask = imfill(mask, 'holes');
mask = bwconvhull(mask);
maskedRgbImage = bsxfun(@times, rgbImage, cast(mask, 'like', rgbImage));
props = regionprops(mask, 'BoundingBox');
croppedImage = imcrop(rgbImage, props.BoundingBox);
%imshow(croppedImage, []);
%title('Cropped RGB Image');
end
