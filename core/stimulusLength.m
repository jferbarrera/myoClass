function [ sLength ] = stimulusLength( segmentation )
%STI Summary of this function goes here
%   Detailed explanation goes here

numSamples = numel(segmentation);
curLength = 0;
curLabel = NaN;
sLength = [];

for j = 1:numSamples
    
    if curLabel ~= segmentation(j)
        % change
        if ~isnan( curLabel )
            sLength(numel(sLength)+1) = curLength;
        end
        
        curLabel = segmentation(j);
        curLength = 1;
        
    else
        % no change
        curLength = curLength + 1;
        
    end
    
end

if ~isnan( curLabel )
    sLength(numel(sLength)+1) = curLength;
end

end

