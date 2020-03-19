function selected_feature_vector = watershedStart(preprocessedImage)
%watershed labels : the resulting partitions of the image
img = preprocessedImage 
figure, imshow(img);
watershed_labels = watershed_segmentation(img);

%cells : the cells in the image, seperated and put to an array (4-D) 
cells = cell_seperate(img, watershed_labels);

selected_cells = find_relative_cells(img, cells);

feature_vector = feature_extract(selected_cells);

selected_feature_vector = select_candidate_feature(feature_vector);
end