function [predictions] = knn_v2(train,test,k,p)

    [testRow,testCol] = size(test);
    predictions = zeros(testRow,2);
    
    for i = 1:testRow
        [neighborClassifications] = neighbors_v2(test(i,:),train,k,p);
        predictions(i,1) = i;
        predictions(i,2) = mode(neighborClassifications);
    end
end