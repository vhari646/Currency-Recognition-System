clc;clear all;close all;
rgbImage=imread('.jpg');     %input currency image 
figure;imshow(rgbImage,[]);title('original')
croppedImage=cropping(rgbImage);  %pre-processing 
im=imresize(croppedImage,[128 256]);
fet=totalfeature(im); %extracted feature of edge and color 
im=rgb2gray(im);
figure;imshow(im,[]); 
load db;   %compare with database 
for i=1:length(db)
     Q(i)=dist(fet(4:14)',db(i).fet(4:14));
end 
[dist,index]=min(Q);
display(Q);
if dist<0.67
    J=db(index).pattern;
    figure,imshow(J(:,:));title('db'); % pattern matching with database 
    p=correlation(im,J);                         
    bw=~im2bw(p,db(index).threshold);
    figure;imshow(bw);title('bw');
    num=findpoint(bw);
    display(num);
    pbw=~im2bw(J,db(index).threshold);
    figure;imshow(pbw);title('pbw');
    value=findpoint(pbw);
    display(value);
    diff=abs(num-value);
    display(diff);
    if diff<=8
        name=db(index).name;    %output result
        fprintf('currency is ');
        display(name);
    else
        fprintf('no match currency ');
    end
else 
    fprintf('no match currency ');
end
    