function [] = addPathPlane()

% Disclamer:
%   SPDX-License-Identifier: GPL-2.0-only
% *************************************************************************

this_file_path = fileparts(mfilename('fullpath'));
models_path = [this_file_path,'/models'];
addpath(genpath(models_path));

% go to initialization directory
cd ../common_functions

% add path for fdm initialization
addPathLadacExamples();

end