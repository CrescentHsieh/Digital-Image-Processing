function obj = Gradient_magnitude(imgname, absolute)
    if nargin < 2, absolute = true; end
    img = imread(imgname);
    N = [
        -3 -3  5;
        -3  0  5;
        -3 -3  5;];
    W = [
         5  5  5;
        -3  0 -3;
        -3 -3 -3;];
    S = [
         5 -3 -3;
         5  0 -3;
         5 -3 -3;];
    E = [
        -3 -3 -3;
        -3  0 -3;
         5  5  5;];

    [rows, cols] = size(img);
    mag = zeros(size(img));

    for i = 2 : rows - 1
        for j = 2 : cols - 1
           gN = mask_sum(img, N, i, j, absolute);
           gW = mask_sum(img, W, i, j, absolute);
           gS = mask_sum(img, S, i, j, absolute);
           gE = mask_sum(img, E, i, j, absolute);

           mag(i, j) = gN + gW + gS + gE;
        end
    end
    imshowpair(img, mag, 'montage');
    obj = mag;
end