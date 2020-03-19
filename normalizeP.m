function nP = normalizeP(p)
    nP = p ./ sqrt(sum(p .^ 2));