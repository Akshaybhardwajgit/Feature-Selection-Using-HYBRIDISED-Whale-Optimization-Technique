

function RA=MutationU(dim,Max_iter, inp,Current_iter)
r=rand(1,dim);
r=r>=(Current_iter/Max_iter);
RA=inp;
%RA(r)=1-RA(r);%set it to inverted value
RA(r)=rand(sum(r(:)),1)>0.5;%set it to new values