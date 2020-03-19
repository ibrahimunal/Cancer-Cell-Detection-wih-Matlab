function [ feature_vector ] = feature_extract( cells )
    %this method uses array 'cells' that contain cells that are selected to
    %be feature extracted
    
    %extracted features are:
      %size
      %color intensity
      
      %3 intensity values (for each RGB) for each cell image
      feature_vector = zeros(3,size(cells,4));
      %remove the black parts so that images are more compact
      for i = 1:size(cells,4)
          img = cells(:,:,:,i);
          figure, imshow(uint8(img));
          newImg = remove_zero_intensity(img);
          
          sum = zeros(size(img,3),1);
          nonzerocount = 0;
          for y = 1:size(newImg,1)
              for x = 1:size(newImg,2)
                  if(newImg(y,x) ~= 0) 
                      sum(1) = sum(1) + newImg(y,x,1);
                      sum(2) = sum(2) + newImg(y,x,2);
                      sum(3) = sum(3) + newImg(y,x,3);
                      nonzerocount = nonzerocount + 1;
                  end
              end
          end
          feature_vector(:,i) = ceil(sum(:)/nonzerocount);
      end
      
      %find the average intensity value and add it to the feature vector
     
end
