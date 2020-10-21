function shape = shape_classification(area, perimeter)
% shape_classification 
% Determine the type of shape (circle, square, or
% something else) from area and perimeter of a segment.
% 
% Input: 
%   area        - Area of the segment in pixels^2
%   perimeter   - Perimeter of the segment in pixels
%
% Output:
%   shape       - An int8, return: 
%                   1 for circle,
%                   2 for square, 
%                   0 for anything else
%

% Make sure your output is of type int8. 
% You can use the function int8() to convert your output to the correct type.

    circularity = (4 * pi * area) / (perimeter ^ 2);

    if circularity > double(1 - 0.0001) && circularity < double(1 + 0.0001)
        shape = 1;
    elseif circularity > double(pi/4 - 0.0001) && circularity < double(pi/4 + 0.0001)
        shape = 2;
    else
        shape = 0;
    end

    shape = int8(shape);

end