%% load project configuration
close all;
config

global COMPUTED_FEATURES_PATH 


%% Script arguments

database_id = 1;
dataset_id = 1;
subject_id =1;
exercise_id = 1;
featureFncName = 'avgDicreteSignalPower';
resultsPath = COMPUTED_FEATURES_PATH{1};

%% load data

% read a subject's data
s1 = loadSubjectData(database_id, dataset_id, subject_id, exercise_id);

% read emg
emg_raw = getSEMG( s1 );

% pre-processing
lpf_coef = getLPFcoef( database_id, dataset_id );
[ emg ] = applyFilter( lpf_coef, emg_raw );
% plotSEMGsignals( emg, emg_filtered );

% read stimulus vector
stimulus = getStimulus(s1);

% read repetition vector
repetition = getRepetition(s1,2);


%% Compute feature

numElectrodes = size(emg, 2);
numStimulus = max( max(stimulus) ); % 0 reposo, 1 .. etc
numRepetitions = max( max (repetition) );

featureFncHandle = str2func( featureFncName );
features = cell( numStimulus+1, numRepetitions, numElectrodes );

% compute feature for each stimul
for e = 1:numElectrodes
    for s = 1:numStimulus
        for r = 1:numRepetitions
            [ segment ] = extractEMGsegment( emg, stimulus, repetition, e, s, r ); 
            featureVec = featureFncHandle( segment ); 
            
            features{s, r, e} = featureVec; %s+1 because 0 is repose
        end
    end
end

% compute feature for repose
for e = 1:numElectrodes
    [ segment ] = extractEMGsegment( emg, stimulus, repetition, e, 0, 0 ); 
    featureVec = featureFncHandle( segment );
    
    for r = 1:numRepetitions        
        features{numStimulus+1, r, e} = featureVec; %s+1 because 0 is repose
    end
end


%% Saving features

[curFeaturePath] = createFeaturesDirStruct( resultsPath, database_id, dataset_id, subject_id, exercise_id );
save( strcat(curFeaturePath, filesep ,featureFncName), 'features' );

