%8/5/2014 - Modified by R. Worley to run with AALMv3. 
%--------------------------------------------------------------------
%
% File: AALM_LG_DR_DUST_ATSDR
%
% Programed by Gary Diamond SRC Inc. 03/12/2014
%
%This run time file implements AALM-LG for a series of DUST Pb intakes at declaed frequencies
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

%Load inputs from AALM-LG INPUT&OUTPUT.xlsm
Status="load inputs"
AALM_LG_IN_v3_060414

TSTOP=2555.;
CINT=1.;

CDUSTBASE=0.;
CDUSTPULSE=1.;
FDUSTPULSE=1.;
DUSTSTART=0.;
DUSTSTOP=TSTOP;
DUSTWID1=7.;
DUSTPER1=7.;
DUSTWID2=TSTOP;
DUSTPER2=TSTOP;

!!START /NC

DUSTWID1STRT=1.;
DUSTWID1=DUSTWID1STRT;
DUSTWID1STP=7.;
DUSTWID1INCR=1.;

CDUSTPULSESTRT=100;
CDUSTPULSE=CDUSTPULSESTRT;
CDUSTPULSESTP=400.;
CDUSTPULSEINCR=100.;
DROUTCC=[];

%Use this for output at TSTOP
%while (DUSTWID1 <= DUSTWID1STP)
%	while (CDUSTPULSE <= CDUSTPULSESTP);	
%		CDUSTPULSE
%		DUSTWID1
%		!!START /NC
%		DROUTC=[DAY CDUSTPULSE DUSTWID1 INTAKE CBLOOD CPLAS CBONE ABLOOD ABONE]; 
%		DROUTCC=[DROUTCC DROUTC];
%		CDUSTPULSE=CDUSTPULSE+CDUSTPULSEINCR;
%	end	
%	DUSTWID1=DUSTWID1+DUSTWID1INCR;
%	CDUSTPULSE=CDUSTPULSESTRT;
%end

%Use this for time series output
while (DUSTWID1 <= DUSTWID1STP)
	while (CDUSTPULSE <= CDUSTPULSESTP);
		CDUSTPULSE
		DUSTWID1
		!!START /NC
		DROUTC=[_day _intake _cblood _cplas _cbone];
		DROUTCC=[DROUTCC DROUTC];
		CDUSTPULSE=CDUSTPULSE+CDUSTPULSEINCR;
	end	
	DUSTWID1=DUSTWID1+DUSTWID1INCR;
	CDUSTPULSE=CDUSTPULSESTRT;
end

%Format and print model output

%Use this for output at TSTOP
%out=fopen('DROUT.out','w');
%fprintf(out,"%e,%e,%e,%e,%e,%e,%e,%e,%e\n",DROUTCC);
%fclose(out);


%Use this for time series output
outmatrix=rot90(fliplr(DROUTCC));
out=fopen('DROUT.out','w');
fprintf(out,"%e,%e,%e,%e,%e\n",outmatrix);
fclose(out);
