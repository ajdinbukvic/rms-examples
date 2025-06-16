function mu = trimf(x, p)
    a = p(1); b = p(2); c = p(3);
    mu = max(min((x - a)/(b - a), (c - x)/(c - b)), 0);
end