function zero_crossing(imgname, method, threshold)
    if nargin < 2, method = "Gradient"; end
    if method == "Gradient"
        img = Gradient_magnitude(imgname, false);
    else
        img = Laplacian_mask(imgname, 8, false);
    end
    if nargin < 3, threshold =max(abs(img(:))) * 0.1; end
    [rows, cols] = size(img);
    mag = zeros(size(img));
    
    for i = 1 : rows - 1
        for j = 1 : cols - 1
            if check_neighbor(img, i, j) == true
                if check_abs_diff(img, i, j, threshold) == true
                    mag(i, j) = 1;
                end
            end
        end
    end
    img = imread(imgname);
    imshowpair(img, mag, 'montage');
end