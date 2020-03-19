function [sharpenedImage] = sharpenImage(noiseRemovedImage)
% Read an image
% Sharpen read image with different amount
sharpenedImage = imsharpen(noiseRemovedImage, 'Amount', 0.1);

% Display the images side-by-side
end