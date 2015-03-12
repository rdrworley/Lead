%--------------------------------------------------------------------
%
% File: AALM_LG_DR_ADULT
%
% Programmed by Gary Diamond
% Syracuse Research Corporation, 09/15/2014
%
%This run time file implements AALM-LG for a series of adult lead intakes
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

TSTOP=18250.; %22000; %10950.; 17885
CINT=365.;

!!START /NC

TSTOP=18250.;
CINT=365.;
INOTHERBASE=0.;
INOTHERPULSE=1.;
FOTHERPULSE=1.;
OTHERSTART=0.;
OTHERSTOP=TSTOP;
OTHERWID1=365.;
OTHERPER1=365.;
OTHERWID2=TSTOP;
OTHERPER2=TSTOP;

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


INOTHERPULSE=2000.;
INSTP=3000.;
INCR=1000.;

while (INOTHERPULSE <= INSTP);	
	!!START /NC
	INOTHERPULSE
	DROUTC=[T INTAKE CBLOOD CPLAS CCORT CTRAB CBONE CCORTASH CTRABASH];
	DROUTCC=[DROUTCC DROUTC];
	INOTHERPULSE=INOTHERPULSE+INCR;
end






%Format and print model output

out=fopen('DROUT ADULT.out','w');
fprintf(out,"%e,%e,%e,%e,%e,%e,%e,%e,%e\n",DROUTCC);
fclose(out);
