function [nonZeroImage] = remove_zero_intensity(img)
%REMOVE_ZERO_ÝNTENSÝTY Summary of this function goes here
%   Detailed explanation goes here
gray_img =  rgb2gray(img);
y = size(img,1)
x = size(img,2)

foregroundcol = any(gray_img);
firstforegroundcol = find(foregroundcol,1);
lastforegroundcol = find(foregroundcol, 1, 'last');

foregroundrow = any(gray_img,2);
firstforegroundrow = find(foregroundrow, 1);
lastforegroundrow = find(foregroundrow, 1, 'last');
nonZeroImage = img(firstforegroundrow:lastforegroundrow, firstforegroundcol:lastforegroundcol,:);
imshow(uint8(nonZeroImage));
end
