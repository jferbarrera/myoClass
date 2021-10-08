function [ segment ] = extractEMGsegmentRepose( EMG, stimulus_vec, repetition_vec, electrode_id, stimulus_id, repetition_id )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% data masks
maskSegment = stimulus_vec == stimulus_id; 

% select an electrode
segment = EMG(:, electrode_id);

%
segment = segment( maskSegment );

end


