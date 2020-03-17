counter = 0;
sample_input = train_data(1,:);
for i = 1:784
    if train_data(1, i) ~= sample_input(i)
       counter = counter + 1;
    end
end
counter