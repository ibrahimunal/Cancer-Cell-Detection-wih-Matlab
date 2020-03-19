function [ selection ] = select_candidate_feature( feature_vectors )
%SELECTCANDÝDATECELL Summary of this function goes here
%   Detailed explanation goes here
    if( size(feature_vectors,1) > 1 )
        mean_intensities = zeros(1, size(feature_vectors,2));
        for i = 1 : size(feature_vectors,2)
            for k = 1 : size(feature_vectors,1)
            mean_intensities(i) = mean_intensities(i) + feature_vectors(k,i);
            end
            mean_intensities(i) = mean_intensities(i)/size(feature_vectors,1)
        end
        [val, idx] = max(mean_intensities)
        selection(:,1) = feature_vectors(:,idx)
    else
        selection(:,1) = [255;255;255];
    end
end

