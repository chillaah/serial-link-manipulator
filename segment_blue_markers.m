function [binary_img, centroids] = segment_blue_markers(img)
% Find the blue markers in an image. 
%   Return Values:
%     binary_img must be of type logical.
%     centroids must be of shape [n, 2].

% reading in the 2 color channels other than blue
R = img(:,:,1); % red
G = img(:,:,2); % green

% creating an image of blue
img = R + G;

% making the image logical but inverted
img = imbinarize(img);

% % rows and columns
% [rows, columns] = size(img);
% 
% % inverting the inverted image :)
% for i = 1:rows
%     for j = 1:columns
%         if img(i, j) == 0
%             img(i, j) = 1;
%         else
%             img(i, j) = 0;
%         end
%     end
% end

% assigning to correct variable name
binary_img = ~img;

% regioprops to identify centroids of the blue shapes
s = regionprops(binary_img, 'Centroid');
centroids = [ 0 0 ];
s_counter = 1;

% for loop to store the centroids in a matrix
for i = 1:numel(s)
    centroids(i, 1) = s(s_counter).Centroid(1);
    centroids(i, 2) = s(s_counter).Centroid(2);
    s_counter = s_counter + 1;
end

end