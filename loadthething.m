te = readtable('test.csv');
tr = readtable('train.csv');
test = te{:,:};
train = tr{:,:};
test_data = test;
test_data(:,2) = [];
train_data = train;
train_data(:,2) = [];
train_label = tr(:,1:2);
test_label = te(:,1:2);
sample_input = test_data(1,2:); % this is wrong
% id, label, pixels 1 to 784