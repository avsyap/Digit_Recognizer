%load data
test = csvread('test.csv',1,0);
train = csvread('train.csv',1,0);
k = 11;

[trainRow,trainCol] = size(train);
sampleIndex = randsample(trainRow,18000);
trainSub = train(sampleIndex,:);

tic
results = knn(train(1:10000,:),train(10000:15000,2:785),k);
toc

csvwrite('knn_results_k-11_euclidean_ttrain_10000-15000.csv',results);