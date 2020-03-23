function x = mask_sum(img, mask, i, j, absolute)
    if absolute
        x = abs(sum(sum(mask.*double(img(i-1:i+1, j-1:j+1)))));
    else
        x = sum(sum(mask.*double(img(i-1:i+1, j-1:j+1))));
    end
end