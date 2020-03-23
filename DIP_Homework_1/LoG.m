function LoG(imgname, n, sigma, threshold)
    img = imread(imgname);
    [rows, cols] = size(img);
    filter = zeros(n);
    g = zeros(size(img));
    tmp = round((n/2)-1);

    for x = 0-tmp:0+tmp
        for y = 0-tmp:0+tmp
            filter(x+tmp+1, y+tmp+1) = (1/(2*pi*sigma^2))*exp(-(x^2+y^2)/2*sigma^2);
        end
    end
    filter = filter/sum(filter(:));
    
    for i = 1+tmp:rows-tmp
        for j = 1+tmp:cols-tmp
            g(i, j) = sum(sum(filter.*double(img(i-tmp:i+tmp, j-tmp:j+tmp))));
        end
    end
    imwrite(uint8(g), 'LoG.tif')
    
    if nargin < 4, threshold = max(g(:))*0.1; end
    zero_crossing("LoG.tif", "Laplacian", threshold);
end