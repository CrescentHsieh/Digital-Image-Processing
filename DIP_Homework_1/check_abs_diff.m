function result = check_abs_diff(img, i, j, threshold)
    result = false;
    
    if abs(img(i, j) - img(i-1, j)) > threshold
        result = true;
        return
    end
    if abs(img(i, j) - img(i+1, j)) > threshold
        result = true;
        return
    end
    if abs(img(i, j) - img(i, j-1)) > threshold
        result = true;
        return
    end
    if abs(img(i, j) - img(i, j+1)) > threshold
        result = true;
        return
    end
end