close all;
I = imread('20.jpg');
I = rgb2gray(I); 
I = medfilt2(I);
I = imresize(I,[128 256]);
J = I(93:108,11:38,:); 
imshow(J),title('PATTERN');
c = normxcorr2(J(:,:),I(:,:));% pattern image and input image 
[max_c, imax] = max(abs(c(:)));
[ypeak, xpeak] = ind2sub(size(c),imax(1));
corr_offset = [(xpeak-size(J,2)) (ypeak-size(J,1))];
figure, imshow(I); hold on;
rectangle('position',[corr_offset(1)+1 corr_offset(2)+1 size(J,2) size(J,1)],...
          'edgecolor','g','linewidth',2);
pattern=I(corr_offset(2)+1:corr_offset(2)+1+size(J,1),corr_offset(1)+1:corr_offset(1)+1+size(J,2),:);
%pattern=~im2bw(pattern,0.7);
figure,imshow(pattern);
figure,imshow(~im2bw(pattern,0.80));
db(2).pattern=pattern;
db(2).threshold=0.8

