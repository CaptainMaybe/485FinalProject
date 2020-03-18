function ct = compete(t)
    t_size = size(t);
    t_size = t_size(2);
    [~, idx] = max(t);
    ct = t;
    for i = 1:t_size
        if i == idx
            ct(i) = 1;
        else
            ct(i) = -1;
        end
    end