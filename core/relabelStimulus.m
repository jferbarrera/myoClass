function [ relabeledStimulus ] = relabelStimulus( stimulusRaw )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

stimulusIndx = unique( stimulusRaw );
                
if (stimulusIndx(2) ~= 1)
    fprintf('** Relabelling stimulus vector \n');
    % re-labeling stimulus index to 0, 1, 2 ,,, n                  

    for i = 2:numel( stimulusIndx )
        mask = stimulusRaw == stimulusIndx( i );
        stimulusRaw(mask) = i-1;
    end
                    
end

relabeledStimulus = stimulusRaw;

end

