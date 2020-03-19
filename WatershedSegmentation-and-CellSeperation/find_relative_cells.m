%we are only looking for the middle 32x32 pixels so other results are
%irrelevant
function relativeCells = find_relative_cells(image, cellArray)
relativeCells = zeros(size(image,1), size(image,2), 3, 1);
    for i = 2 : size(cellArray,4)
        isFound = 0;
        img = cellArray(:,:,:,i);
        if(~isFound)
        for j = size(cellArray,1) * 1/3 : size(cellArray,1) * 2/3
            if(~isFound)
            for k = size(cellArray,2) * 1/3 : size(cellArray,2) * 2/3
                curRGB = img(j,k,:) 
                 if(curRGB ~= [0 0 0]) %if there is a value assigned, than it means there is a cell overlapping with the center 32x32 area
                     x = reshape(img,size(img,1),size(img,2),size(img,3),1)
                     x = cellArray(:,:,:,i);
                     relativeCells = cat(4,relativeCells,x);
                     isFound = 1;
                     break
                 end
                end
            end
        end
        end
    end
end