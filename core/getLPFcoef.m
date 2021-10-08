function [ d ] = getLPFcoef( database_id, dataset_id )
% GETLPF This function computes the coefficients of a low pass filter with cutoff frequency of 1hz 
%   [f] = GETLPF(database_id, dataset_id)
%   read the repetition list from repetition vector
%
% Example:
%   out = getLPF(1, 1); computes the coefficients of a LPF for ninapro
%   dataset

switch database_id 
    case 1
        
        switch dataset_id 
            case 1
                fs = 100; % hz
                fc = 3; % hz
                fc_normalized = (2*fc)/fs;
                %fstop_normalized = fc_normalized * 1.20;
                
                d = designfilt('lowpassiir', 'FilterOrder',2, ...
                    'HalfPowerFrequency',fc, 'DesignMethod', 'butter', ...
                    'SampleRate',fs);
            case 2
                fs = 100; % hz
                fc = 5; % hz
                fc_normalized = (2*fc)/fs;
                %fstop_normalized = fc_normalized * 1.20;
                
                d = designfilt('lowpassiir', 'FilterOrder',2, ...
                    'HalfPowerFrequency',fc, 'DesignMethod', 'butter', ...
                    'SampleRate',fs);
            case 3
                fs = 2000; % hz
                fc = 100; % hz
                fc_normalized = (2*fc)/fs;
                %fstop_normalized = fc_normalized * 1.20;
                
                d = designfilt('lowpassiir', 'FilterOrder',2, ...
                    'HalfPowerFrequency',fc, 'DesignMethod', 'butter', ...
                    'SampleRate',fs);
        end
    
    case 2
        switch dataset_id 
            case 1
                fs = 10; % hz
                fc = 1; % hz
                fc_normalized = (2*fc)/fs;

                d = designfilt('lowpassiir', 'FilterOrder',2, ...
                    'HalfPowerFrequency',fc, 'DesignMethod', 'butter', ...
                    'SampleRate',fs);
        end
        
    otherwise
        fprinf('Update getLPFcoef function !!!!');
        
end

% see filter response
% fvtool(d);

end
