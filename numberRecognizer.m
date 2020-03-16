images = gpuArray(loadMNISTImages('train-images.idx3-ubyte'));
labels = gpuArray(loadMNISTLabels('train-labels.idx1-ubyte'));
test_P = gpuArray(loadMNISTImages('t10k-images.idx3-ubyte'));
test_TNum = gpuArray(loadMNISTLabels('t10k-labels.idx1-ubyte'));
test_T = gpuArray(convertT(test_TNum ).');
n = size(test_TNum);

P = images;
T = convertT(labels)';

t_num = 10;
lrs = gpuArray([0.04 0.05 0.06 0.07 0.08 0.09 0.1 0.11 0.12 0.13]);
lrs_size = size(lrs);
lrs_size = lrs_size(2);
e2 = zeros(t_num,lrs_size);

for k = 1:t_num
    for j = 1:lrs_size
        [W1, W2, b1, b2, out] = backprop(10,P, T, lrs(j));
        total = 0;
        for i = 1:n(1)
            [n1, n2, a, a1] = propogateForward(test_P(:,i), W1, W2, b1, b2);
            e = sum(squaredError(a, test_T(:,i)));
            total = total + e;
        end
        e2(k,j) = total/n(1);
    end
end