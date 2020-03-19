function [l] = watershed_segmentation(rgbimage)
rgb = rgbimage; %read the image
I = rgb2gray(rgb); %turn to grayscale

gmag = imgradient(I); %gradient of the image

ws = watershed(gmag); %normal watershed
wsRGB = label2rgb(ws);


%Marking the foreground objects
    %NOTE: opening-closing and opening-closing by recounstruction are
    %different approaches. The 2 approaches are not dependent to each other
%opening-closing
se = strel('disk',2);
io = imopen(I,se);

%opening by reconstruction(morphological reconstruction)
ie = imerode(I,se);
iobr = imreconstruct(ie,I);

%opening-closing
ioc = imclose(io,se);

%opening closing by reconstruction
iobrd = imdilate(iobr,se);
iobrcbr = imreconstruct(imcomplement(iobrd), imcomplement(iobr));
iobrcbr = imcomplement(iobrcbr); %normally 

fgm = imregionalmin(iobrcbr); %regional minima of opening-closing by Reconstruction
%note: if regional maximas are taken, then the white(background) objects
%are selected, in our case this is reversed.

%i2 = labeloverlay(I,fgm); %minimas are shown on the image

se2 = strel(ones(1,1));
fgm2 = imclose(fgm,se2);
fgm3 = imerode(fgm2,se2);

fgm4 = bwareaopen(fgm3,1,1);
%i3 = labeloverlay(I,fgm4);

bw = imbinarize(iobrcbr); %thresholding

%thinning the bacground by SKIZ
%watershed ridge lines created
d = bwdist(bw); %TODO: Examine this part, the result is not correct
dl = watershed(d);
bgm = dl == 0; % ridge lines
gmag2 = imimposemin(gmag, bgm | (fgm4)); 
l = watershed(gmag2); %compute watershed

%Watershed applied in a second method gave better result with cell.tif
D = -bwdist(~bw);
D(~bw) = -Inf;
L = watershed(D);
bgm2 = L == 0 %ridge lines
gmag22 = imimposemin(gmag, bgm2 | (fgm4));
%%%%%%%%%%%%%%%%%%%%%%

labels = imdilate (L == 0, ones(1,1)) + 30*bgm2 + 1*fgm4;
%i4 = labeloverlay(I, labels);
lrgb = label2rgb(L, 'jet', 'w');

figure ('name','yeehav')
imshow(I);
hold on
himage = imshow(lrgb);
himage.AlphaData = 0.3;
end