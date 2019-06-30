function n = ij2n(i, j, length, height)
    if i > height || j > length
        error('Niepoprawne wspó³rzêdne')
    end
    
    n = (i - 1)*length + j;
end

