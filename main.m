a = readtable('train_labels.csv')
b = a(:,1);
feature_vector = zeros(3,size(b,1));

%this loop runs for each image in the given training images (these images 
%are selected by the train_labels.cvs file which containts image names and 
%labels associated with these images)
for i = 1:size(b,1)
    name = string(b{i,1});
    filename = char('images/' + name(1,1) + '.tif');
    img = imread(filename);
    
    ppi = preprocess(img); %preprocess stage returns the preprocessed image
    
    %watershed is applied to the preprocessed 
    %image the result is a feature vector containing all the features of POSSIBLE candidate cells
    f_v = watershedStart(ppi);
    
    feature_vector(:,i) = f_v(:,1); %out of all the possible candidates, one is selected as the primary candidate
end
%each image has one candidate cell.
%at this point we have all the primary candidate cell features in feature_vector

%program can proceed to SVM stage