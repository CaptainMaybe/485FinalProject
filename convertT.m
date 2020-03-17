
function t_new = convertT(t_old)
    s = size(t_old);
    s = s(1);
    t_new = zeros(s, 10);
    for i = 1:s
        for j = 0:9
            if j == t_old(i,1)
                t_new(i, j + 1) = 1;
            end
        end
    end