function [ rootOutputPath, outputDataPath ] = computeFeature( database_id, dataset_id, subject_id, exercise_id, featureFncName, resultsPath )
%COMPUTEFEATURE This function compute a feature from EMG signals

% load data

% read a subject's data
[s1, emg_raw, stimulus, repetition ] = loadSubjectData( database_id, dataset_id, subject_id, exercise_id );

% pre-processing
lpf_coef = getLPFcoef( database_id, dataset_id );
[ emg ] = applyFilter( lpf_coef, emg_raw );
% plotSEMGsignals( emg_raw(:,1:2), emg(:,1:2) );
%
% figure('Name', 'filter' ); hold on; 
% plot( emg(1:20000,1), '-r', 'LineWidth', 3 );
% plot( emg_raw(1:20000,1), '-b' );
%
%    figure('Name', 'stimulus' ); hold on;
%    plot( 10 * emg(1:20000,1) );
%    plot( stimulus(1:20000), '-r' );
%    plot( repetition(1:20000) , '-b' );
%    legend('stimulus', 'restimulus');

%% Compute feature

numElectrodes = size(emg, 2);
numStimulus = max( max(stimulus) ); % 0 reposo, 1 .. etc
numRepetitions = max( max (repetition) );

featureFncHandle = str2func( featureFncName );
features = cell( numStimulus+1, numRepetitions, numElectrodes );
class = zeros(numStimulus,1);

% compute feature for each stimul
for e = 1:numElectrodes
    for s = 1:numStimulus
        for r = 1:numRepetitions
            [ segment ] = extractEMGsegment( emg, stimulus, repetition, e, s, r ); 
            
            if ( numel(segment) < 10 )
                [ segment ] = extractMaxEMGsegment( emg, stimulus, repetition, e, s, r ); 
                fprintf('---> extracting max emg segment\n');
            end
            
            %fprintf('---> size=%d e=%d s=%d r=%d\n', numel(segment), e, s, r);
            featureVec = featureFncHandle( segment ); 
            features{s, r, e} = featureVec; %s+1 because the last entry is repose
        end
        
        class(s) = s;
    end
end

% compute feature for repose
for e = 1:numElectrodes
    [ segment ] = extractEMGsegmentRepose( emg, stimulus, repetition, e, 0, 0 ); 
    featureVec = featureFncHandle( segment );
    
    for r = 1:numRepetitions        
        features{numStimulus+1, r, e} = featureVec; %s+1 is the repose
    end
    
    class(numStimulus+1) = numStimulus+1;
end


% Saving features
[rootOutputPath, curFeaturePath ] = createFeaturesDirStruct( resultsPath, database_id, dataset_id, subject_id, exercise_id );
outputDataPath = strcat( curFeaturePath, filesep ,featureFncName, '_E', num2str( exercise_id ), '.mat' );
save( outputDataPath, 'features', 'featureFncName', 'class' );

end