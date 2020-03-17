function [w1, w2, b1, b2, a] = backprop(input_num, P, T)
    
    inputs = 784; % 784 inputs
    hidOutputs = 40; % 20 nn in hidden layer
    outputs = 10; % 10 classifications
    lr = 0.08;
    
    %randomize the starting weights to values close to zero
    w1 = 2.*rand(inputs,hidOutputs).' - 1;
    w2 = 2.*rand(hidOutputs, outputs).' - 1;
    b1 = 2.*rand(hidOutputs,1) - 1;
    b2 = 2.*rand(outputs,1) - 1;
    
    epoch_num = 10;
    
    for j = 1:epoch_num
      for i = 1:input_num %i is column num (or respective input vector)
        [n1, n2, a, hidA] = propogateForward(P(i,:)', w1, w2, b1, b2);
        s2 = computeOutputSensitivities(a, T(i,:)', n2);
        s1 = backpropogateSensitivities(w2, s2, n1);
        [w1, b1] = updateWeightAndBiases(w1, b1, s1, P(i,:)', lr);
        [w2, b2] = updateWeightAndBiases(w2, b2, s2, hidA, lr);
      end
    end