function n = count_needles(img)

    clc;

    img = rgb2gray(img);
    
    thresh1 = 290/2;
  
    img = img - thresh1;
    
    img = imbinarize(img);
    
    img = 1 - img;
    
    thresh2 = 10000;
    
    filter = bwareaopen(img, thresh2);
    
    holes = img - filter;
    
    count = logical(holes);

    points = regionprops(count);
    
    invalid = cat(1, points.Area);
    
    thresh3 = 10;
    
    invalid = sum(invalid < thresh3);
    
    n = size(points);
    
    n = max(n);
    
    n = n - invalid;
    
end

% function n = count_needles(img)
% 
%     
% %% Convert Image to Greyscale
%     img = rgb2gray(imread('needles_48.png'));
%     %figure(); imshow(img);
%   
% %% Convert Image to Binary 
%     mask = img - 145;
%     mask = imbinarize(mask);
%     mask = ~mask; %invert
%     %figure(); imshow(mask);
%     
% %% Seperate inner circles
%     mask2 = bwareaopen(mask, 10000);
%     %figure(); imshow(mask2);
%     
%     inner = mask - mask2;
%     %figure(); imshow(inner);
%     
% %% Label each section
%     labeled = logical(inner);
%     %unique(labeled)
%     
% %% Remove extra pixel errors and count
%     needles = regionprops(labeled);
%     errors = sum(cat(1, needles.Area) < 10);
%     n = max(size(needles)) - errors;
%     
% end
    