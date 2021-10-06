function [ subjectData, emg_raw, stimulus, repetition ] = loadSubjectData( database_id, dataset_id, subject_id, exercise_id )
% LOADSUBJECTDATA read a subject data
%   [subjectData] = LOADSUBJECTDATA(database_id, subject_id, exercise_id)
%   read a subject data given a dataset_id, subject_id, and exercise_id
%
% Example:
%   out = loadSubjectData(1, 1, 1, 1); for ninapro database, DB1, S1, set
%   of exercises 1

global DATABASE_PATH 

if isempty('NINAPRO_DATABASE_PATH')
    error('Error. \n NINAPRO_DATABASE_PATH does no exist, run config.m','');
end


filepath = '';
filename = '';

% load mat file
switch database_id
    case 1   %ninpro
        switch dataset_id
            case 1
                filepath = strcat(DATABASE_PATH{database_id}, 'DB', num2str(dataset_id), filesep, 's', num2str(subject_id));
                filename = sprintf('S%d_A%d_E%d.mat', subject_id, 1, exercise_id );
            case 2
                filepath = strcat(DATABASE_PATH{database_id}, 'DB', num2str(dataset_id), filesep, 's', num2str(subject_id));
                filename = sprintf('S%d_E%d_A%d.mat', subject_id, exercise_id, 1 );
            case 3
                % we rename .mat files following DB1 nomenclature
                filepath = strcat(DATABASE_PATH{database_id}, 'DB', num2str(dataset_id), filesep, 's', num2str(subject_id));
                filename = sprintf('S%d_A%d_E%d.mat', subject_id, 1, exercise_id );
            
        end
end

subjectData = load( strcat(filepath, filesep, filename) );
% debug here and execute dummy_plot()

% get data from structure
switch database_id
    case 1   %ninpro
        switch dataset_id
            case 1
                emg_raw = subjectData.emg;
                [ stimulus ] = relabelStimulus( subjectData.restimulus );
                repetition = subjectData.rerepetition;
            case 2
                emg_raw = double( abs( subjectData.emg ) );
                [ stimulus ] = relabelStimulus( subjectData.restimulus );
                repetition = subjectData.repetition;
                
            case 3
                % no consecutive stimulus index
                emg_raw = double( abs( subjectData.emg ) );
                [ stimulus ] = relabelStimulus( subjectData.restimulus );
                repetition = subjectData.repetition;
        end
end


end

function dummy_plot()
    figure('Name', 'stimulus' ); hold on;
    plot( double( abs( subjectData.emg(1:100000,1) ) ) );
    plot( subjectData.stimulus(1:100000), '-r' );
    plot( subjectData.restimulus(1:100000) , '-b' );
    legend('emg','stimulus', 'restimulus');
    
    figure('Name', 'repetition' ); hold on;
    plot( double( abs( subjectData.emg(1:100000,1) ) ) );
    plot( subjectData.repetition(1:100000), '-r' );
    plot( subjectData.rerepetition(1:100000), '-b' );
    legend('emg','repetition', 'rerepetition');
end