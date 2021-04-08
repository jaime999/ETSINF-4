#!/usr/bin/octave -qf

if(nargin!=3)
  	printf("Usage: ./experiment.m <data> <alphas> <bes>\n");
  	exit(1);
end

arg_list=argv();
data=arg_list{1};
as=str2num(arg_list{2});
bs=str2num(arg_list{3});
load(data); [N,L]=size(data); D=L-1;

ll=unique(data(:,L)); C=numel(ll);
rand("seed",23); data=data(randperm(N),:);
NTr=round(.7*N); M=N-NTr; te=data(NTr+1:N,:);
printf("#      a       	b   E   k   Ete Ete (%%)    Ite (%%)\n");
printf("#------- -------- ---- ---- --- -------- ----------\n");

for a=as
  for b=bs
  	[w,E,k]=perceptron(data(1:NTr,:),b,a); r1=zeros(M,1);
  	for n=1:M rl(n)=ll(linmach(w,[1 te(n,1:D)]')); end
	[nerr m]=confus(te(:,L),rl);
	aux=(nerr/M);
	s=sqrt(aux*(1-aux)/M);
	r=1.96*s;
	m=(nerr/M)*100;
	output_precision(2);
	printf("%8.1f %8.1f %3d %3d %4d %8.1f  [%3f, %3f]\n",a, b, E, k, nerr, m, (aux-r)*100, (aux+r)*100);
 end;
end; 
