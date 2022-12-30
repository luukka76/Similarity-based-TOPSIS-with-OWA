function [cc,SPIS,SNIS]=topsissimowa(data,crit,p,alpha1,alpha2,w)
x=data;
[m,n]=size(x);
if nargin<6
    w=ones(1,n);
elseif nargin<5
    alpha2=1;
elseif nargin<4
    alpha1=1;
elseif nargin<3
   p=1;
end

%a=zeros(m,n);
%Normalization:
a=normalize(x,'range');
%weigted normalized decision matrix:
r=w.*a;
%Positive and negative ideal solutions:
PIS=zeros(1,n);
NIS=zeros(1,n);
for j=1:n
    if crit(j)==1
        PIS(j)=max(r(:,j));
        NIS(j)=min(r(:,j));
    else
        PIS(j)=min(r(:,j));
        NIS(j)=max(r(:,j));
    end
end

%Similarities to PIS and NIS
% SPIS=zeros(1,m);
% SNIS=zeros(1,m);
 
 SPIS=simLPowa(PIS,r,p,alpha1)';
 SNIS=simLPowa(NIS,r,p,alpha2)';

%Closeness coefficient: 
 cc=zeros(1,m);
 for i=1:m
     cc(i)=SPIS(i)/(SPIS(i)+SNIS(i));
 end
