function repaired_img = repair(img)

    % Your function will be called with img containing a grayscale uint8 image.
    repaired = medfilt2(img);
    repaired_img = repaired;
    
end