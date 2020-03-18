loadthething

train_num = 50000;
test_num = 10000;

P = train_data(1:train_num,:) / 255.0;
T = train_label(1:train_num,1);
T = convertT(T);
test_P = train_data(train_num + 1:end,:) / 255.0;
test_T = train_label(train_num + 1:end,1);
test_T = convertT(test_T);

lr = [0.02 0.04 0.06 0.08 0.1];
% lr = [0.1, 0.12, 0.14, 0.16, 0.18];
lr_num = size(lr);
lr_num = lr_num(2);
trial_num = 10;

for ln = 1:lr_num
    for tn = 1:trial_num
        [W1, W2, b1, b2, out] = backprop(train_num,P, T, lr(ln));
        total = 0;

        for i = 1:test_num
            %inhibP = latInhibSquare(test_P(i,:)');
            [n1, n2, a, a1] = propogateForward(test_P(i,:)', W1, W2, b1, b2);
            e = sum(squaredError(a, test_T(i,:)'));
            total = total + e;
        end
        e2(ln,tn) = total/test_num;
    end
end