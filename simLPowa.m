function totsim = simLPowa(center, data,p,alpha)
%Input:
%center: PIS or NIS vector.
%data: weighted normalized decision matrix.
%p: parameter for similarity measure
%alpha: parameter for RIM quantifier for generating weights for OWA
%operator
%
%Output: totsim=similarity value for each attribute

% fill the output matrix (not needed in newer versions of matlab)
%out = zeros(size(center, 1), size(data, 1));

Ideal=ones(size(data, 1), 1)*center;

[n,m]=size(data);
simM=zeros(n,m);

for i=1:n
    for j=1:m
        simM(i,j)=(1-abs(data(i,j)^p-Ideal(i,j)^p))^(1/p);
    end
end
%Generating weights for OWA using RIM quantifier
w=Rim1(m,alpha);

%Aggregating similarity matrix using OWA
totsim=owamatrix(simM,w);
    

