function [ repetition ] = getRepetition( subjectDataStructure, dataSource )
% GETREPETITION read stimulus data (see page 2 Building the NINAPRO database)
%   [repetition] = GETREPETITION(subjectDataStructure)
%   read the repetition list from repetition vector
%   [repetition] = GETREPETITION(subjectDataStructure, dataSource)
%   read the repetition list from repetition vector when dataSource is set to 1 or
%   rerepetition when dataSource is set to 2
%
% Example:
%   out = getRepetition(s1); read repetition vector

switch nargin 
    case 1
        repetition = subjectDataStructure.repetition;
    case 2
        switch dataSource 
            case 1
                repetition = subjectDataStructure.repetition;
            case 2
                repetition = subjectDataStructure.rerepetition;

        end
end

end

