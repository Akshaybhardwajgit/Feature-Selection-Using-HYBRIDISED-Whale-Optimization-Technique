

function out=CrossOverU(RA,RE)
r=rand(size(RA))<0.5;
out(r)=RA(r);
out(~r)=RE(~r);