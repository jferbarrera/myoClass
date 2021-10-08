function [ segment ] = extractMaxEMGsegment( EMG, stimulus_vec, repetition_vec, electrode_id, stimulus_id, repetition_id )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% data masks
maskStml = stimulus_vec == stimulus_id; 
maskRep = repetition_vec == repetition_id;

if ( numel(maskStml) >= numel(maskStml) )
    maskSegment = maskStml;
else
    maskSegment = maskRep;
end

% select an electrode
segment = EMG(:, electrode_id);

%
segment = segment( maskSegment );

end

