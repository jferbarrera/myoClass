function [ sEMG_filtered ] = applyFilter( filterCoef, sEMG )
%APPLYFILTER performs zero-phase digital filtering by processing the input data, 
%performs zero-phase digital filtering by processing the input data, sEMG, 
%in both the forward and reverse directions, in both the forward and reverse directions. 
%
% Example:
%   out = applyFilter(filterCoef, emg); 


numSignals = size(sEMG, 2);
sEMG_filtered = zeros(size(sEMG));

for i = 1:numSignals

    sEMG_filtered(:,i) = abs( filtfilt(filterCoef, sEMG(:,i) ) );
    
end

end

