function [ sEMG ] = getSEMG( subjectDataStructure, electrode_id )
% GETSEMG read sEMG data
%   [sEMG] = GETSEMG(subjectDataStructure)
%   read all emg signals from a structure
%   [sEMG] = GETSEMG(subjectDataStructure, electrode_id)
%   read a particular electrode_id emg's signal from a structure
%
% Example:
%   out = getSEMG( s1,2 ); second electrode signal
%   out = getSEMG( s1 ); all electrodes' signal


switch nargin 
    case 1
        sEMG = subjectDataStructure.emg;
    case 2
        sEMG = subjectDataStructure.emg( :, electrode_id );

        
end

