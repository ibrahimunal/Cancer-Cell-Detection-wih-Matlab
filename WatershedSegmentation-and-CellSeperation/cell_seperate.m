
function cellArray = cell_seperate(image, labels)
    maxVal = max(labels(:));
    cellArray = zeros(size(image,1), size(image,2), 3, (maxVal+1));
    for i = 1 : size(image,2)
        for j = 1 : size(image,1)
           cellArray(j, i,:, labels(j,i)+1) = image(j,i,:);
        end
    end
    
     img = zeros(size(cellArray,2), size(cellArray,3),size(cellArray,4));
    for i = 2:maxVal+1
        img = cellArray(:,:,:,i);
    end  
end