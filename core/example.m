%% load project configuration
close all;


%%

% read a subject's data
s1 = loadSubjectData(1,1,1,1);

figure;
hold on;

% read the second electrode EMG signal
electrode_1 = getSEMG(s1,1);
electrode_2 = getSEMG(s1,2);
electrode_3 = getSEMG(s1,3);
plot( electrode_1(1:3000) );
plot( electrode_2(1:3000) );
plot( electrode_3(1:3000) );


% read stimulus vector
stimulus = getStimulus(s1);
plot( stimulus(1:3000) );

% read repetition vector
repetition = getRepetition(s1,2);
plot( repetition(1:3000) );

% filter
lpf_coef = getLPFcoef( 1, 1 );
filteredSignal = abs( filtfilt(lpf_coef, electrode_2) );

figure;
hold on;

% plot original and filtered signal
plot( electrode_2(1:3000) );
plot( filteredSignal(1:3000), 'LineWidth',3 );


%%

emg = getSEMG(s1,1:2);
lpf_coef = getLPFcoef( 1, 1 );
[ emg_filtered ] = applyFilter( lpf_coef, emg );
stimulus = getStimulus(s1,2);


[ labels ] = combineSegmentations( stimulus, repetition, 2 );
[ sEMG_normalized ] = normalizeSEMG( emg_filtered, labels, 1 );
plotSEMGsignals(sEMG_normalized, sEMG_normalized, stimulus);



