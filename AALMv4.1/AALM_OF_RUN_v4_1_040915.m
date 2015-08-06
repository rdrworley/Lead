%
% Created by Gary Diamond, SRC, Inc, 04/09/15
%
%This run time file:
%	Runs m-file: AALM_OF_IN.m that read inputs for AALM_OF.acsl 
%	Runs m-file: AALM_OF_OUT.m that writes outputs from AALM_OF.acsl
%	Starts the simulation
% --------------------------------------------------------------------
%Prepare and clear all variables
prepare @clear @all

%Set number format
set @format=shorte

%Set system variables for reproting data on integration process and states
CJVITG=0;	%Suppress Jacobian check and error report
WEDITG=0;  %Write event description when using SCHEDULE for state events
WESITG=0;	%Write error summary
WNDITG=0;	%Suppress writing data about ingetration process
WXDITG=0;	%Suppress writing extra data during integration

%Load inputs from AALM-OF.xls
Status="load inputs"
AALM_OF_IN_v4_1_040915

%Start simulation
Status='run start'
!!START /NC

%Prepare output
status="prepare output"
AALM_OF_OUT_v4_1_040915;

Status='run end'