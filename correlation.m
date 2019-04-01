function p=correlation(im,J)
c = normxcorr2(J(:,:),im(:,:));
[max_c, imax] = max(abs(c(:)));
[ypeak, xpeak] = ind2sub(size(c),imax(1));
corr_offset = [(xpeak-size(J,2)) (ypeak-size(J,1))];
p=im(corr_offset(2)+1:corr_offset(2)+1+size(J,1),corr_offset(1)+1:corr_offset(1)+1+size(J,2)); 
figure, imshow(im); hold on;
rectangle('position',[corr_offset(1)+1 corr_offset(2)+1 size(J,2) size(J,1)],...
          'edgecolor','g','linewidth',2);
end
