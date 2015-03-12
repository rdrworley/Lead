%--------------------------------------------------------------------
%
% File: AALM_LG_DR_CHILD
%
% Programmed by Gary Diamond
% Syracuse Research Corporation, 09/15/2014
%
%This run time file implements AALM-LG for a series of child lead intakes
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

%Load inputs from AALM-LF.xls
Status="load inputs"
AALM_LG_IN_v4_091514

TSTOP=730.;
CINT=1.;
INOTHERBASE=0.;
INOTHERPULSE=1.;
FOTHERPULSE=1.;
OTHERSTART=0.;
OTHERSTOP=TSTOP;
OTHERWID1=7.;
OTHERPER1=7.;
OTHERWID2=TSTOP;
OTHERPER2=TSTOP;
RBAOTHER=0.6;

!!START /NC


INOTHERPULSE=5.;
INSTP=350.;
INCR=5.;
DROUTCC=[];


INOTHERPULSE=1.;
INSTP=10.;
INCR=1.;
DROUTCC=[];

while (INOTHERPULSE <= INSTP);	
	!!START /NC
	INOTHERPULSE
	DROUTC=[T INTAKE CBLOOD CPLAS CCORT CTRAB CBONE CCORTASH CTRABASH];
	DROUTCC=[DROUTCC DROUTC];
	INOTHERPULSE=INOTHERPULSE+INCR;
end

INOTHERPULSE=20.;
INSTP=100.;
INCR=10.;

while (INOTHERPULSE <= INSTP);	
	!!START /NC
	INOTHERPULSE
	DROUTC=[T INTAKE CBLOOD CPLAS CCORT CTRAB CBONE CCORTASH CTRABASH];
	DROUTCC=[DROUTCC DROUTC];
	INOTHERPULSE=INOTHERPULSE+INCR;
end

INOTHERPULSE=200.;
INSTP=1000.;
INCR=100.;

while (INOTHERPULSE <= INSTP);	
	!!START /NC
	INOTHERPULSE
	DROUTC=[T INTAKE CBLOOD CPLAS CCORT CTRAB CBONE CCORTASH CTRABASH];
	DROUTCC=[DROUTCC DROUTC];
	INOTHERPULSE=INOTHERPULSE+INCR;
end

%Format and print model output

out=fopen('DROUT CHILD.out','w');
fprintf(out,"%e,%e,%e,%e,%e,%e,%e,%e,%e\n",DROUTCC);
fclose(out);


