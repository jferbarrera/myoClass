function addPathToLibraries()

fprintf('**************************\n');
fprintf('** myoClass toolbox     **\n');
fprintf('**************************\n\n');

sprintf('\nLoading toolbox dependencies\n');

% local functions
addpath( './core/' );
addpath( './apps/');

% GLOBAL VARIABLES
global DATABASE_NAME
global DATABASE_PATH 
global COMPUTED_FEATURES_PATH 

%database names
DATABASE_NAME{ 1 } = 'ninapro';

% database list
DATABASE_PATH{ 1 } = '/Users/fernando/emg_database/ninapro/';

% path to computed features
COMPUTED_FEATURES_PATH{ 1 } = '/Users/fernando/emg_database/results_ninapro/';

fprintf('\n\n');
fprintf('Loading global variables ...OK');
fprintf('\n\n');
end
