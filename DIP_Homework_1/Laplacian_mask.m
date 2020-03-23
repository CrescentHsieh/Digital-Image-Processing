function obj = Laplacian_mask(imgname, neighbor, absolute, mask)
    if nargin < 2, neighbor = 4; end
    if nargin < 3, absolute = true; end
    if nargin < 4, mask = "mask"; end
    img = imread(imgname);
    high_lap = [ 1  1  1;
                 1 -8  1;
                 1  1  1;];
    low_lap = [ 0  1  0;
                1 -4  1;
                0  1  0;];
    [rows, cols] = size(img);
    mag = zeros(size(img));

    for i = 2 : rows - 1
        for j = 2 : cols - 1
            if mask ~= "normal"
                if neighbor == 8
                    mag(i, j) = mask_sum(img, high_lap, i, j, absolute);
                else
                    mag(i, j) = mask_sum(img, low_lap, i, j, absolute);
                end
            else
                if neighbor == 8
                    mag(i, j) = lap_sum_neighbor(img, 8, i, j, absolute);
                else
                    mag(i, j) = lap_sum_neighbor(img, 4, i, j, absolute);
                end
            end
        end
    end
    % imshow(mag)
    imshowpair(img, mag, 'montage');
    obj = mag;
end
