tr = readtable('train.csv');
train = tr{:,:};
train_data = train(:,2:end);
train_data(:,2) = [];
train_label = tr{:,2};
% sample_input = train_data(1,:);
% id, label, pixels 1 to 784