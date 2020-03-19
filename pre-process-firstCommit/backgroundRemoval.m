function [backgroundRemovedImage] = backgroundRemoval(enhencedImage)
level=graythresh(enhencedImage);
backgroundRemovedImage = imbinarize(enhencedImage,level);
end