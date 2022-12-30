function h=owamatrix(A,w)
% Aggregating matrix to a vector using w as weights for owa.
n=size(A,1);
h=zeros(n,1);
for i=1:size(A,1)
    apu=A(i,:);
    h(i)=sum(sort(apu,2,'descend').*w);
end
