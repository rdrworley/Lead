%--------------------------------------------------------------------
%
% File: AALM_LG_RUN.m
%
% Created by Gary Diamond, SRC, Inc, 06/04/14
%
%This run time file:
%	Runs m-file: AALM_LG_IN.m that read inputs for AALM_LG.acsl 
%	Runs m-file: AALM_LG_OUT.m that writes outputs from AALM_LG.acsl
%	Starts the simulation
% --------------------------------------------------------------------
%Prepare and clear all variables
prepare @clear @all

%Set number format
%set @format=shorte

%Set system variables for reproting data on integration process and states
CJVITG=0;	%Suppress Jacobian check and error report
WEDITG=0;  %Write event description when using SCHEDULE for state events
WESITG=0;	%Write error summary
WNDITG=0;	%Suppress writing data about ingetration process
WXDITG=0;	%Suppress writing extra data during integration

%Load inputs from AALM-LF.xls
Status="load inputs"
AALM_LG_IN_v3_060414


%Start simulation
Status='run start'
!!START /NC

%Prepare output
Status="prepare output"
AALM_LG_OUT_v3_060414;

Status='run end'