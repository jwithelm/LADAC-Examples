
% Disclamer:
%   SPDX-License-Identifier: GPL-2.0-only
% 
%   Copyright (C) 2020-2022 Yannic Beyer
%   Copyright (C) 2022 TU Braunschweig, Institute of Flight Guidance
% *************************************************************************

%% add to path
addPathMuetze();
clc_clear;

%% load physical copter parameters
copter = copterLoadParams( 'copter_params_Muetze' );

%% environment parameters
envir = envirLoadParams('params_envir','envir',0);

%% controller parameters
% load parameters
fm_loiter = loadParams( 'fmCopterLoiterIndi_params_muetze' );

%% joystick
jystck = joystickLoadParams( 'joystick_params_Xbox_360', 2, 0 );

%% initial conditions (IC)
% load initial conditions
IC = loadInitialConditionsParams( 'params_initial_conditions_hover' );

% initial motor angular velocity, in rad/s
IC.omega_mot = [ 1; 1; 1; 1 ] * 380.8113;
% trim command
u_Trim = ones(4,1) * 0.53714;

%% load ground parameters (grnd)
grnd = groundLoadParams( 'params_ground_default' );

%% reference position lat, lon, alt
pos_ref = posRefLoadParams( 'reference_position_params_default' );
% initial altitude, in m
pos_ref.alt = 10;

%% Flight Gear settings for UDP connection
% Flight Gear URL
fg.remoteURL = '127.0.0.1';
% fdm receive port of Flight Gear
fg.remotePort = 5502;

%% Open Simulink model
open_model('QuadcopterSimModel_INDI_Loiter_simple')
