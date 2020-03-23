function x = lap_sum_neighbor(img, neighbor, i, j, absolute)
    x = 0;

    if neighbor == 4
        x = img(i+1, j) + img(i-1, j) + img(i, j+1) + img(i, j-1);
    else
        for tmp_i = i-1 : i+1
            for tmp_j = j-1 : j+1
                x = x + img(tmp_i, tmp_j);
            end
        end
    end
    x = x - neighbor*img(i, j);
    
    if absolute
        x = abs(x);
    end
end