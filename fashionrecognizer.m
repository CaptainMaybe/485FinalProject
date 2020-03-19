loadthething

train_num = 50000;
test_num = 10000;

P = train_data(1:train_num,:) / 255.0;
T = train_label(1:train_num,1);
T = convertT(T);
test_P = train_data(train_num + 1:end,:) / 255.0;
test_T = train_label(train_num + 1:end,1);
test_T = convertT(test_T);

%lr = [0.02 0.04 0.06 0.08 0.1];
%lr = [0.004, 0.008, 0.012, 0.014, 0.016, 0.02];
%lr_num = size(lr);
%lr_num = lr_num(2);
hnn = 25;
%lr = .08;
%hnn = [10 15 20 25 30 35];
%hn_num = size(hnn);
%hn_num = hn_num(2);
trial_num = 10;
down_factor = [0.95 0.96 0.97 0.98 0.99];
up_factor = [1.05 1.04 1.03 1.02 1.01];
factor_num = size(up_factor);
factor_num = factor_num(2);
lr = 0.2;
mse = -5;
for pn = 1:factor_num
    for tn = 1:trial_num
        [W1, W2, b1, b2, out] = backprop(train_num,P, T, lr, hnn, 1.02, down_factor(pn), up_factor(pn));
        total = 0;
        
        for i = 1:test_num
            %inhibP = latInhibSquare(test_P(i,:)');
            nP = normalizeP(test_P(i,:)');
            [n1, n2, a, a1] = propogateForward(nP, W1, W2, b1, b2);
            %ct = compete(test_T(i,:)');
            e = sum(squaredError(a, test_T(i,:)'));
            total = total + e;
        end
        e2(pn,tn) = total/test_num;
    end
end