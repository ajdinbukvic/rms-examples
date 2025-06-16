function prost = jeste_prost(n)
    if n < 2
        prost = false;
        return
    end
    for i = 2:sqrt(n)
        if mod(n,i) == 0
            prost = false;
            return
        end
    end
    prost = true;
end