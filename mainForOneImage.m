close all
img = imread('images/fff9a690ea76205a76bb3da952a365763e81228c.tif');
ppi = preprocess(img);
watershed_segmentation(ppi);