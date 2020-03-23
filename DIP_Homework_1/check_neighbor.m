function result = check_neighbor(img, i, j)
    result = false;
    tmp = 0;
    
    if img(i, j) == 0
        result = false;
        return
    end
    for x = i-1 : i+1
        if img(x, j) == 0
            continue
        else
            if sign(img(i, j)) + sign(img(x, j)) == 0
                tmp = tmp + 1;
            end
        end
    end
    for y = j-1 : j+1
        if img(i, y) == 0
            continue
        else
            if sign(img(i, j)) + sign(img(i, y)) == 0
                tmp = tmp + 1;
            end
        end
    end
    if tmp >= 2
        result = true;
        return
    end
end