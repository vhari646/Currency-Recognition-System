clc;clear all;
di = dir('C:\Users\crazyhatter\Desktop\image processing\project\image\database\*.jpg');
rgbImage=[];
name=[];
for k= 1:length(di)
rgbImage{k} = imread(['',di(k).name]);
% rgbImage=imread('2.jpg');
%croppedImage=cropping(rgbImage);
%im=imresize(croppedImage,[128 128]);
im=imresize(rgbImage{k},[128 256]);
[rows, columns, numberOfColorChannels] = size(im);
colfet=color(im);
edhist= edgehist(im);
% fet{k}=totalfeature(im);
% name{k}=di(k).name;
db(k).name=di(k).name;
db(k).fet=totalfeature(im);
 end