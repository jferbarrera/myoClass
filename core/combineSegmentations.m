function [ labels ] = combineSegmentations( stimulus, repetition, type )
%COMBINESEGMENTATIONS This function combines two segmentations, that is stimulus and
%repetition, in order to compute a unique label, labels are no consecutives
%
% type = 1 by combination
%   labels formula
%       labels = stimulus * 100 + repetition
% type = 2 by stimulus
%   labels formula
%       labels = stimulus

numStimuls = max(max(stimulus));
numRepetition = max(max(repetition));
labels = zeros( size(stimulus) );

switch (type)

    case 1
        for i = 1:numStimuls

            mask1 = stimulus == i;

            for j = 1:numRepetition 
                mask2 = repetition == j;
                mask = and( mask1,mask2 );

                labels(mask) = i*100 + j;

                % figure; hold on; plot(mask1), plot(mask2); plot(mask);
            end
        end

    case 2
        for i = 1:numStimuls
            
            mask1 = stimulus == i;
            
            for j = 1:numRepetition 
                mask2 = repetition == j;
                mask = and( mask1,mask2 );

                labels(mask) = i;

                % figure; hold on; plot(mask1), plot(mask2); plot(mask);
            end

        end
end

