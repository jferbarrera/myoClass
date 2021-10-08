function [ stimulus ] = getStimulus( subjectDataStructure, dataSource )
% GETSTIMULUS read stimulus data (see page 2 Building the NINAPRO database)
%   [stimulus] = GETSTIMULUS(subjectDataStructure)
%   read the stimulus from stimulus vector
%   [stimulus] = GETSTIMULUS(subjectDataStructure, dataSource)
%   read the stimulus from stimulus vector when dataSource is set to 1 or
%   restimulus when dataSource is set to 2
%
% Example:
%   out = getStimulus(s1); read stimulus

switch nargin 
    case 1
        stimulus = subjectDataStructure.stimulus;
    case 2
        switch dataSource 
            case 1
                stimulus = subjectDataStructure.stimulus;
            case 2
                stimulus = subjectDataStructure.restimulus;

        end
end

end
