%--------------------------------------------------------------------
%
% File: AALM_LG_OUT.m
%
% Created by Gary Diamond, SRC Inc, 06/04/14
%
%This run time file writes output from AALM_LG.csl to AALM_LG_OUTPUTDATA.DAT
% --------------------------------------------------------------------

a=[_day];
b=[_year];
c=[_intake];
d=[_cblood];
e=[_cplas];
%f=[_crbc];
f=[_ckidney];
g=[_cliver];
h=[_ccort];
k=[_ctrab];
l=[_cbone];
m=[_ablood];
n=[_aplas];
o=[_arbc];
p=[_akidney]; 
q=[_aliver];
r=[_acort];
s=[_atrab];
t=[_abone];
u=[_asoft];
v=[_abrain];
w=[_art];
x=[_aurine];
y=[_afecal];
z=[_tbody];
za=[_pclear];
zb=[_bclear];


outputmatrix=[a,b,c,d,e,f,g,h,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,za,zb];
outmatrix=rot90(fliplr(outputmatrix));
out=fopen('AALM_LG_OUTPUTDATA.DAT','w');
fprintf(out,"%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f\n",outmatrix);
fclose(out);


