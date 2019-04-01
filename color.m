function feature=color(rgb_im)
xyzTransformation = makecform('srgb2xyz');
xyzI = applycform(rgb_im,xyzTransformation);
luvTransformation = makecform('xyz2uvl');
luvI = applycform(xyzI,luvTransformation);
figure;imshow(luvI,[]);title('luv color space')
L=luvI(:,:,1);
U=luvI(:,:,2);
V=luvI(:,:,3);
feature(1)= mean(L(:));
feature(2) = std(L(:))^2;
feature(3)= skewness(L(:));
feature(4) = mean(U(:));
feature(5) = std(U(:))^2;
feature(6) = skewness(U(:));
feature(7) = mean(V(:));
feature(8) = std(V(:))^2;
feature(9) = skewness(V(:));

feature=feature';
end