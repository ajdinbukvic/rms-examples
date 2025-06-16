function mu = trapmf(x, p)
    a=p(1); b=p(2); c=p(3); d=p(4);
    mu = max(min(min((x-a)/(b-a),1),(d-x)/(d-c)),0);
end