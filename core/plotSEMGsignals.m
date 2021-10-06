function [ ] = plotSEMGsignals( sEMG, envelope, stimulus )
%PLOTSEMGSIGNALS plots a emg signal, its envelope, and stimulus label
%
%

numSignals = size(sEMG, 2);
numSamples = size(sEMG, 1);
numStimulus = 0;
stimulusDemux = 0;
cmap = 0;


if nargin > 2
    numStimulus = max(max(stimulus));
    stimulusDemux = zeros( numSamples,numStimulus );
    maxSEMGvalue = max(max(sEMG));
    
    for i = 1:numStimulus
        mask = stimulus == i;
        vector = zeros(numSamples,1);
        vector(mask) = maxSEMGvalue+0.5;
        stimulusDemux(:,i) = vector;
    end
    
    cmap = jet( numStimulus + 4);
end

[ha, pos] = tight_subplot(numSignals, 1, [.01 .03], [.1 .01], [.01 .01]);

for i = 1:numSignals
    axes(ha(i));
    %subplot( numSignals, 1 , i );
    switch (nargin)
        case 1
            
            plot( sEMG(:,i), '-b' );
    
        case 2
            plot( sEMG(:,i), '-b' );
            hold on;
            plot( envelope(:,i), '-r', 'LineWidth',1 );
        case 3
            plot( sEMG(:,i), '-b' );
            hold on;
            plot( envelope(:,i), '-r', 'LineWidth',1 );
            
            for j = 1:numStimulus
                plot( stimulusDemux(:,j), 'color', cmap(j+2,:));
            end
    end
    
end

set(ha(1:numSignals-1),'XTickLabel',''); 
set(ha,'YTickLabel','')


end
