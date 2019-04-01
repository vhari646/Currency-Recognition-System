function edhist= edgehist(rgb_im)
I=rgb2ycbcr(rgb_im);
y=double(I(:,:,1));
f1 = zeros(3,3,5);
f1(:,:,1) = [1 2 1;0 0 0;-1 -2 -1]; %vertical
f1(:,:,2) = [-1 0 1;-2 0 2;-1 0 1];   %horizontal
f1(:,:,3) = [2 2 -1;2 -1 -1; -1 -1 -1];% 45 diagonal
f1(:,:,4) = [-1 2 2; -1 -1 2; -1 -1 -1];%135 diagonal
f1(:,:,5) = [-1 0 1;0 0 0;1 0 -1]; % non directional
for i = 1:5
sobelim(:,:,i) = filter2(f1(:,:,i),y);
end
[m, p] = max(sobelim,[],3);
edim = edge(y, 'canny');
figure;imshow(edim,[]);title('edge')
im2 =(p.*edim);
figure;imshow(im2,[]);title('max grdient edge')
edhist=hist(im2(:),5)./10000;
edhist=edhist';

end