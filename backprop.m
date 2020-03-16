function [w1, w2, b1, b2, out] = backprop(epoch_num, P, T, lr)

    numNeuronInputsW1 = length(P(:,1)); %num of inputs for each input vector found by taking the length of the first column
    numNueronOutputsW2 = length(T(:,1));
    numNeuronOutputsW1 = 20;

    %randomize the starting weights to values close to zero
    w1 = gpuArray(2.*rand(numNeuronInputsW1,numNeuronOutputsW1).' - 1);
    w2 = gpuArray(2.*rand(numNeuronOutputsW1, numNueronOutputsW2).' - 1);
    b1 = gpuArray(2.*rand(numNeuronOutputsW1,1) - 1);
    b2 = gpuArray(2.*rand(numNueronOutputsW2,1) - 1);

    % [n1, n2, a, a1] = propogateForward(p0, w1, w2, b1, b2);
    % s2 = computeOutputSensitivities(a, t0, n2);
    % s1 = backpropogateSensitivities(w2, s2, n1);
    % [w1, b1] = updateWeightAndBiases(w1, b1, s1, p0);
    % [w2, b2] = updateWeightAndBiases(w2, b2, s2, a1);

    input_num = length(P(1,:)); %number of input vectors taken by finding the length of the first row of P
    

    for j = 1:epoch_num
      for i = 1:input_num %i is column num (or respective input vector)
        [n1, n2, out, a1] = propogateForward(P(:,i), w1, w2, b1, b2);
        
        s2 = computeOutputSensitivities(out, T(:,i), n2);
        s1 = backpropogateSensitivities(w2, s2, n1);
        [w1, b1] = updateWeightAndBiases(w1, b1, s1, P(:,i), lr);
        [w2, b2] = updateWeightAndBiases(w2, b2, s2, a1, lr);
      end
    end