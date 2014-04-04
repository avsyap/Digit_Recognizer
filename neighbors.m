function [neighbors] = neighbors(x,S,k)
	%x is the point in question
	%S is the solution space
    %k is the number of neighbors to be obtained
    
    [Srow,Scol] = size(S);
    Sdata = S(:,2:Scol);
    eucDistances = zeros(Srow,2);
    
    for i = 1:Srow
        eucDistances(i,1) = i;
        %eucDistances(i,2) = norm(Sdata(i,:) - x);
        eucDistances(i,2) = sum(abs(Sdata(i,:) - x));
    end
    
    ranked = sortrows(eucDistances,2);
    neighbors = S(ranked(1:k,1),1);
end
    