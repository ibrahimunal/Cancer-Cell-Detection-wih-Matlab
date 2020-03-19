
function [noiseRemovedImage] = noiseRemove(noisyImage)
h_gaussian = fspecial('gaussian');
h_average = fspecial('average');

noiseRemovedImage = imfilter(noisyImage, h_gaussian);



end

