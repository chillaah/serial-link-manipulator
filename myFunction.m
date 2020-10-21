% function filled = myFunction(img)
% close all; clear; clc

function filled = myFunction(img)

    %reading the empty image as a default checker to the program
    empty_image = imread('example_empty.jpg');
    
    % checking the difference between the new image and the default empty image
    difference = img - empty_image;
    
    % 'z' as a counter for the light pixels
    z = 0;
    threshold = 50;
    
    % using a for loop to check if the pixels 
    % have values greater than the threshold
    for x = 1:size(img,1) % number of rows
        for y = 1:length(img) % number of columns
            if difference(x, y) > threshold
                z = z + 1;
            end
        end
    end
    
    % checking a condition and deciding if the tote is empty(0) or not(1)
    % output is provided in the variable filled as a 'boolean'
    if z > 600
        filled = true; %1
    else
        filled = false; %0
    end

end

% 
% img_empty1_hist = histogram(img_empty1, 'BinLimits', [0 255], 'BinWidth', 1);
% img_empty2_hist = histogram(img_empty2, 'BinLimits', [0 255], 'BinWidth', 1);
% img_filled1_hist = histogram(img_filled1, 'BinLimits', [0 255], 'BinWidth', 1);
% img_filled2_hist = histogram(img_filled2, 'BinLimits', [0 255], 'BinWidth', 1);
% 
% diff1 = img_empty1 - img_empty2;
% diff2 = img_empty1 - img_filled1;
% diff3 = img_filled1 - img_filled2;
% diff4 = img_empty2 - img_filled2;
% 
% diff1_hist  = histogram(diff1, 'BinLimits', [0 255], 'BinWidth', 1);


% diff_simple = img_empty1 - img_filled1;
% figure()
% imshow(diff_simple/255, 'InitialMagnification', 'fit');
% diff_simple_hist = histogram(diff_simple, 'BinLimits', [0 255], 'BinWidth' ,1);
% 
% diff_double = abs(double(img_filled1) - double(img_empty1));
% figure()
% imshow(diff_double/255, 'InitialMagnification', 'fit');
% diff_double_hist = histogram(diff_double, 'BinLimits', [0 255], 'BinWidth' ,1);

% if diff_double_hist(100:255) == 0
%     filled = false;
% else
%     filled = true;
% end

% figure();
% histogram(img_empty1, 'BinLimits', [0,255], 'BinWidth', 1);
%     
% figure();
% histogram(img_empty2, 'BinLimits', [0,255], 'BinWidth', 1);
% 
% figure();
% histogram(img_filled1, 'BinLimits', [0,255], 'BinWidth', 1);
% 
% figure();
% histogram(img_filled2, 'BinLimits', [0,255], 'BinWidth', 1);
    
% monadic = img_empty1 > 219;
% monadic = ~monadic;
% figure(5);
% imshow(monadic, 'InitialMagnification', 'fit');
% title('Monadic');
% 
% monadic2 = img_filled1 > 219;
% monadic2 = ~monadic2;
% figure(6);
% imshow(monadic2, 'InitialMagnification', 'fit');
% title('Monadic');

% imbinarize_empty1 = imbinarize(img_empty1, 50/255);
% %imbinarize_empty1 = ~imbinarize_empty1;
% figure();
% imshow(imbinarize_empty1, 'InitialMagnification', 'fit');
% title('Imbinarized');
% 
% imbinarize_filled1 = imbinarize(img_filled1, 50/255);
% %imbinarize_filled1 = ~imbinarize_filled1;
% figure(6);
% imshow(imbinarize_filled1, 'InitialMagnification', 'fit');
% title('Imbinarized');
% 
% diff = abs(double(img_empty1) - double(img_empty1));
% figure();
% imshow(diff/255, 'InitialMagnification', 'fit');
% title('Correct Method');
% 
% figure();
% histogram(diff, 'BinLimits', [0,255], 'BinWidth', 1);
% 
% figure();
% histogram(imbinarize_empty1, 'BinLimits', [0,255], 'BinWidth', 1);
% 
% figure();
% histogram(imbinarize_filled1, 'BinLimits', [0,255], 'BinWidth', 1);
% 
% diif_simple = img_empty2 - img_empty1;
% figure();
% imshow(diff, 'InitialMagnification', 'fit');
% title('Simple Difference');
% 
% figure();
% histogram(diff);
    
    
    
    
    
    
    
    
% end

% function filled = myFunction(img)
% 
% %     Your function will be called with img containing an opened image.
% %     img = imread('example_empty.jpg');
% %     myFunction(img)
%     img = imread('example_filled2.jpg');
%     
%     % Determine whether the img shows an empty tote or not.
%     [bincount] = histcounts(img, (0:255));
%     
%     null = 0;
%     
%     for i = 1:255
%         z = bincount(i);
%         if z == 0
%             null = null + 1
%         end
%     end
%     
%     % Return 0 if the tote is empty, and 1 otherwise.
%     if null > 20
%         filled = false;
%     else
%         filled = true;
%     end
%     
%     % Hint: use the available example files: example_empty.jpg, example_empty2.jpg, example_filled.jpg, and example_filled2.jpg
% 
% 
% end


% % loading the 2 images onto the workspace
% empty = imread('example_empty.jpg');
% full = imread('example_filled.jpg');
% 
% % displaying the 2 images
% figure(1);
% imshow(empty, 'InitialMagnification', 'fit')
% figure(2);
% imshow(full, 'InitialMagnification', 'fit')
% 
% % displaying the histograms of the 2 images
% figure(3);
% empty_hist = histogram(empty, 'BinLimits', [0 255], 'BinWidth', 1);
% title('empty');
% figure(4);
% full_hist = histogram(full, 'BinLimits', [0 255], 'BinWidth', 1);
% title('full');
% 
% % gathering the bin count information of each histogram
% [bincounts_empty] = histcounts(empty,(0:255));
% [bincounts_full] = histcounts(full, (0:255));
% 
% % initializing variables
% empty_zeros = 0;
% full_zeros = 0;
% 
% % looping over each bin in both the histograms
% % to find the number of bins with value '0'
% for i = 0:255
%     if (bincounts_empty(i) == 0)
%         empty_zeros = empty_zeros + 1;
%     end
% end
% 
% for i = 0:255
%     if (bincounts_full(i) == 0)
%         full_zeros = full_zeros + 1;
%     end
% end
% 
% % the image with more zeros is the image which is empty
% % as it has lower values towards the black region (towards '0')
% % therefore producing a higher count of zeros
% if (empty_zeros > full_zeros)
%     return
% else
%     return
% end