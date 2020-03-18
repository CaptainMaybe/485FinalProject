loadthething

train_num = 50000;
test_num = 10000;

P = train_data(1:train_num,:) / 255.0;
T = train_label(1:train_num,1);
T = convertT(T); %convert's the label to a vector i.e. 
test_P = train_data(train_num + 1:end,:) / 255.0;
test_T = train_label(train_num + 1:end,1);
test_T = convertT(test_T);



test_thing_num = 1;
trial_num = 10;
for i = 1:test_thing_num 
    for j = 1:trial_num
        w = trainKohonen(P, T);
        e2(i,j) = testKohonen(w1, test_P, test_T);
    end
end

plottrials;