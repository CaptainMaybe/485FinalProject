function [w1, w2, b1, b2, a] = backprop(input_num, P, T, lt, hnn, percent, ulr, dlr)
    
    lr = lt;
    inputs = 784; % 784 inputs
    hidOutputs = hnn; %25; % hn num neural networks
    outputs = 10; % 10 classifications
    
    %randomize the starting weights to values close to zero
    w1 = 2.*rand(inputs,hidOutputs).' - 1;
    w2 = 2.*rand(hidOutputs, outputs).' - 1;
    b1 = 2.*rand(hidOutputs,1) - 1;
    b2 = 2.*rand(outputs,1) - 1;
    
    epoch_num = 4;
    old_e = -1;
    wo1 = w1;
    wo2 = w2;
    bo1 = b1;
    bo2 = b2;
    for j = 1:epoch_num
      for i = 1:input_num %i is column num (or respective input vector)
        %inhibP = latInhibSquare(P(i,:)');
        [n1, n2, a, hidA] = propogateForward(P(i,:)',w1, w2, b1, b2);
        e = sum(squaredError(a, T(i,:)'));
        if old_e > 0 && e > old_e * percent
            w1 = wo1;
            w2 = wo2;
            b1 = bo1;
            b2 = bo2;
            lr = lr .* dlr;
        else
            old_e = e;
            if e < old_e
                lr = lr .*  ulr;
            end
            if lr < 0.00001
                lr = lt;
            end
        end
        s2 = computeOutputSensitivities(a, T(i,:)', n2);
        s1 = backpropogateSensitivities(w2, s2, n1, hidA);
        [w1, b1, wo1, bo1] = updateWeightAndBiases(w1, b1, s1,P(i,:)', lr);
        [w2, b2 wo2, bo2] = updateWeightAndBiases(w2, b2, s2, hidA, lr);
      end
    end