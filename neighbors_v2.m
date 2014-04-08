function [neighborClassifications] = neighbors_v2(x,S,k,p)
	%x is the point in question
	%S is the solution space
    %k is the number of neighbors to be obtained
    %p is the stagnation threshold
    
    %get dimensions of S
    [Srow,Scol] = size(S);
    %remove first column
    Sdata = S(:,2:Scol);
    %initialize distance matrix
    eucDistances = zeros(Srow,2);
    %initialize current k nearest neighbors matrix
    currentNeighbors = zeros(k,1);
    
    %initialize counters
    ctr = 1;
    stagnation = 0;
    %counts how many iterations have passed with same neighbor list
  
    while (ctr <= Srow && stagnation < p)
        eucDistances(ctr,1) = ctr;
        eucDistances(ctr,2) = norm(Sdata(ctr,:) - x);
        %eucDistances(ctr,2) = sum(abs(Sdata(i,:) - x));
        if ctr >= k
            %sort based on smallest distances
            ranked = sortrows(eucDistances(1:ctr,:),2);
            %returns the row indices of the k nearest neighbors
            neighborIndices = sortrows(ranked(1:k,1));
            if sum(neighborIndices == currentNeighbors) == k
                %current
                stagnation = stagnation + 1;
            else
                stagnation = 0;
                currentNeighbors = neighborIndices;
            end
        end
        ctr = ctr + 1;
    end
    
    %returns the digit classifications
    neighborClassifications = S(neighborIndices,1);
end
    