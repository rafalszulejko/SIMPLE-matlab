function n = ij2n(i, j, length, height)
    if i > height || j > length
        error('Niepoprawne wsp�rz�dne')
    end
    
    n = (i - 1)*length + j;
end

