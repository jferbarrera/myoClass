function [ sEMG_normalized ] = normalizeSEMG( sEMG, segmentation, type )
%NORMALIZESEMG This function normalizes a matrix sMEG by columns given a
%segmentation vector
%
% normalization type:
%       1   -   zero mean and unit standard deviation
%
% Example:
%   out = normalizeSEMG(emg, segmentation, 1); 
%

nonlabel = segmentation == 0;
labels = unique(segmentation(~nonlabel));
numLabels = numel(labels);
numSignals = size(sEMG,2);
sEMG_normalized = zeros(size(sEMG));


switch (type)
    case 1  % zero mean and unit standard deviation
        for j = 1:numSignals
            vec = sEMG(:,j);
            
            for i = 1:numLabels
                mask = segmentation == labels(i);
                vec_mask = vec(mask);
                [Y,PS] = mapstd(vec_mask');
                vec(mask) = Y;
                % figure; hold on: plot(mask); plot()
            end
            
            sEMG_normalized(:,j) = vec;
            
        end
end
end
