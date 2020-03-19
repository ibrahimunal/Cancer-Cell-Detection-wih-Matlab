function [enhencedImage] = enhenceImage(sharpenedImage)   
grayScale=rgb2gray(sharpenedImage);
enhencedImage = imadjust(grayScale);
end