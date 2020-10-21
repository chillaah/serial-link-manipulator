function n = how_many(img)

    % Your function will be called with img being a binary image of type 'logical'.
    
    % displaying the original image
    figure();
    imshow(img);
    
    % converting the image to binary
    BW = imbinarize(img, 'adaptive');
    figure();
    imshow(BW);
    
    % closing out the small pores of noise
    binaryiso = imopen(BW, strel('square', 20));
    figure();
    imshow(binaryiso);

    % using 'regionprops' to identify the blobs sperately
    s = regionprops(binaryiso, 'Area', 'BoundingBox');
    n = length(s);

end