loadthething

train_num = 50000;
test_num = 10000;

P = train_data(1:train_num,:) / 255.0;
T = train_label(1:train_num,1);
T = convertT(T);
test_P = train_data(train_num + 1:end,:) / 255.0;
test_T = train_label(train_num + 1:end,1);
test_T = convertT(test_T);


[W1, W2, b1, b2, out] = backprop(train_num,P, T);
total = 0;

for i = 1:test_num
    [n1, n2, a, a1] = propogateForward(test_P(i,:)', W1, W2, b1, b2);
    e = sum(squaredError(a, test_T(i,:)'));
    total = total + e;
end
e2 = total/test_num;
