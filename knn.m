function [predictions] = knn(train,test,k)

    [testRow,testCol] = size(test);
    predictions = zeros(testRow,2);
    
    for i = 1:testRow
        neighborlist = neighbors(test(i,:),train,k);
        predictions(i,1) = i;
        predictions(i,2) = mode(neighborlist);
    end
end