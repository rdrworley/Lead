%--------------------------------------------------------------------
%
% File: AALM_OF_OUT.m
%
% Created by Gary Diamond, SRC Inc, 49/09/15
%
%This run time file writes output from AALM_OF.csl to AALM_OF_OUPUT.DAT
% --------------------------------------------------------------------

a=[_age];
b=[_ageday];
c=[_intake];
d=[_cblood];
e=[_cplas];
f=[_ckidney];
g=[_cliver];
h=[_cwell];
k=[_cpoor];
l=[_ccort];
m=[_ctrab];
n=[_cbone]; 
o=[_ablood];
p=[_akidney];
q=[_aliver];
r=[_awell];
s=[_apoor];
rs=[_aother];
t=[_acort];
u=[_atrab];
v=[_abone];
w=[_art];
x=[_aurine];
y=[_afecal];
z=[_tbody];
az=[_camc];
bz=[_tamc];
cz=[_pclear];

outputmatrix=[a,b,c,d,e,f,g,h,k,l,m,n,o,p,q,r,s,rs,t,u,v,w,x,y,z,cz];
outmatrix=rot90(fliplr(outputmatrix));
out=fopen('AALM_OF_OUTPUTDATA.DAT','w');
fprintf(out,"%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f\n",outmatrix);
fclose(out);
