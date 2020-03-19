function preprocessedImage=preprocessStart(img)
originalImage = img
noiseRemovedImage=noiseRemove(originalImage);
sharpenedImage=imageSharpening(noiseRemovedImage);
enhencedImage=imageEnhence(sharpenedImage);
backgroundRemovedImage=backgroundRemoval(enhencedImage);
preprocessedImage = uint8(1-backgroundRemovedImage).*originalImage;
imshow(preprocessedImage);
end