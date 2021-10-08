function [ subjetPath, featuresPath ] = createFeaturesDirStruct( featuresPath, database_id, dataset_id, subject_id, exercise_id )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

%fprintf('Checking ... %s\n', featuresPath);

global DATABASE_NAMES

if ~exist(featuresPath, 'dir')
    mkdir(featuresPath)
    fprintf('... creating %s\n', featuresPath);
end

featuresPath = strcat( featuresPath, filesep, DATABASE_NAMES{database_id});
%fprintf('Checking ... %s\n', featuresPath);

if ~exist(featuresPath, 'dir')
    mkdir(featuresPath)
    fprintf('... creating %s\n', featuresPath);
end

featuresPath =  strcat(featuresPath, filesep, 'DB', num2str(dataset_id));
%fprintf('Checking ... %s\n', featuresPath);

if ~exist(featuresPath, 'dir')
    mkdir(featuresPath)
    fprintf('... creating %s\n', featuresPath);
end

featuresPath = strcat(featuresPath, filesep, 's', num2str(subject_id));
subjetPath = featuresPath;
%fprintf('Checking ... %s\n', featuresPath);

if ~exist(featuresPath, 'dir')
    mkdir(featuresPath)
    fprintf('... creating %s\n', featuresPath);
end


featuresPath = strcat(featuresPath, filesep, 'e', num2str(exercise_id));
%fprintf('Checking ... %s\n', featuresPath);

if ~exist(featuresPath, 'dir')
    mkdir(featuresPath)
    fprintf('... creating %s\n', featuresPath);
end

end

