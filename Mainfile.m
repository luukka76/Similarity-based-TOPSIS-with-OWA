% Mainfiles purpose is to show how to use Similarity based topsis with owa
% operator, published in:
% P. Luukka, J. Stoklasa, Similarity based TOPSIS with 
% linguistic-quantifier based aggregation using OWA, Annals of computer 
% science and information systems,vol. 29, 2021, pp. 45-51.

%Loading the data. In this example we have 20 alternatives to be ranked and
%three different criteria. First and third are benefit and second cost
%criteria.

load Possmoments.txt
data=Possmoments;

%Define whether criteria is benefit criteria or cost criteria in crit
%vector 1=benefit, 2=cost.
crit=[1 2 1];

%Define parameter p for similarity (default is p=1;) and alpha for RIM
%quantifier to generate weights for OWA operator. alpha1 is for PIS and
%alpha2 is for NIS.
p=1; 
alpha1=2;
alpha2=0.1;

%Define importance weigths for criteria (default is equal weights). Each
%weight should be inside the unit interval w \in [0,1]. Example:

%w=[1,1,1];

[cc,SPIS,SNIS]=topsissimowa(data,crit,p,alpha1,alpha2);
%[cc,SPIS,SNIS]=topsissimowa(data,crit,p,alpha1,alpha2,w); %if you also give
%weights for each criteria.

%For output of the function you get:
%cc = closeness coefficient values for alternatives
%SPIS = similarity to positive ideal solution
%SNIS = similarity to negative ideal solution 

%You can get the ordering of the alternatives by sorting CC to descending order
[Y,I]=sort(cc,'descend');

