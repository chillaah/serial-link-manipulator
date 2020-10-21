function [triangles, squares, circles, mask] = shapes(image)
    % Return the centroids of all triangles, squares, and circles.
    %
    % Inputs Variable:
    %        img will be a grayscale image of type uint8.
    %
    % Outputs:
    %   triangles, squares, cirles should be of shape [n, 2]
    %   mask should be the binarized image, but is not evaluated. It can be
    %   helpful for your debugging.
    
%     img = imread('test_images/test_30.png');
%     
%     mask = img;
% 
%     mask = imbinarize(mask, 'adaptive', 'ForegroundPolarity','dark', 'Sensitivity', 0.55);
%  
%     mask = bwareaopen(mask, 30000);
%     
%     mask = 255 - mask;
% 
%     s1 = regionprops('table', mask, 'Centroid', 'MajorAxisLength', 'MinorAxisLength');
%     
%     centroids = cat(1, s1.Centroid);
%     
%     s2 = regionprops('table', mask, 'Circularity', 'MajorAxisLength', 'MinorAxisLength');
%     
%     circularity = cat(1, s2.Circularity);
%     
%     circle = circularity > 0.95;
%     
%     triangle = circularity < 0.65;
%     
%     square = (0.65 < circularity) & (circularity < 0.87);
% 
%     a = centroids(:,1) .* circle(:,1);
%     
%     a(a == 0) = [];
%     
%     b = centroids(:,2) .* circle(:,1);
%     
%     b(b == 0) = [];
%     
%     circles = [a, b];
%     
%     a = centroids(:,1).* triangle(:,1);
%     
%     a(a == 0) = [];
%     
%     b = centroids(:,2) .* triangle(:,1);
%     
%     b(b == 0) = [];
%     
%     triangles = [a, b];
%     
%     a = centroids(:,1) .* square(:,1); 
%     
%     a(a == 0) = [];
%     
%     b = centroids(:,2) .* square(:,1);
%     
%     b(b == 0) = [];
%     
%     squares = [a, b];
    
    %% Import Image   

    %image = img;
    %figure(); imshow(image);
    %figure(); imhist(image);

%% Threshold    
    %image_minus = image - 40;
    %figure(); imshow(image_minus);
    %figure(); imhist(image_minus);
    
%% Binary Image Test
    %image2 = imbinarize(image_minus);
    %figure(); imshow(image2);
    
%% Binary Image Adaptive
    %image3 = imbinarize(image,'adaptive','ForegroundPolarity','dark','Sensitivity',0.577);
    image3 = imbinarize(image,'adaptive','ForegroundPolarity','dark','Sensitivity',0.55);
%     figure(); imshow(image3);

%% Fixing Adaptive Error and Invert Image
    im = bwareaopen(image3, 30000);
    %image4(1500:1520,370:390) = 0; %%Redundant%%
    image4 = ~im;
%     figure(); imshow(im);

%% Centroids
    cent = regionprops('table',image4,'Centroid','MajorAxisLength','MinorAxisLength');
    centroids = cat(1,cent.Centroid);
    
    %figure(); imshow(image4);
    %hold on
    %plot(centroids(:,1),centroids(:,2),'b*');
    %hold off

%% Circularity
    cent2 = regionprops('table',image4,'Circularity','MajorAxisLength','MinorAxisLength');
    roundness = cat(1,cent2.Circularity);
    
    circle = roundness>0.9;
    triangle = roundness<0.63;
    
    square = (0.63<roundness) & (roundness<0.87);
    
%% Plot Circles
    %figure(); imshow(image4);
    %hold on
    %plot(centroids(:,1).*circle(:,1),centroids(:,2).*circle(:,1),'r*');
    %plot(centroids(:,1).*triangle(:,1),centroids(:,2).*triangle(:,1),'b*');
    %plot(centroids(:,1).*square(:,1),centroids(:,2).*square(:,1),'g*');
    %hold off

%% Add Data to Matrix

    a = centroids(:,1).*circle(:,1); a(a==0) = [];
    b = centroids(:,2).*circle(:,1); b(b==0) = [];
    circles = [a,b];
    
    a = centroids(:,1).*triangle(:,1); a(a==0) = [];
    b = centroids(:,2).*triangle(:,1); b(b==0) = [];
    triangles = [a,b];
    
    a = centroids(:,1).*square(:,1); a(a==0) = [];
    b = centroids(:,2).*square(:,1); b(b==0) = [];
    squares = [a,b];
    
    mask = image4;
    
    
%% Final Check 
    %figure(); imshow(image4);
    %hold on
    %plot(circles(:,1), circles(:,2),'b*');
    %plot(triangles(:,1), triangles(:,2),'r*');
    %plot(squares(:,1), squares(:,2),'g*');
    %hold off
    
    
    %%
%     imtool(mask);
        
    % s = regionprops(mask, 'Circularity', 'Centroid');
    
%     circles = [0, 0];
%     
%     squares = [0, 0];
%     
%     triangles = [0, 0];
%     
%     circle_count = 1;
%     square_count = 1;
%     triangle_count = 1;
%     s_counter = 1;
%     
%     circle_count1 = 0;
%     square_count1 = 0;
%     triangle_count1 = 0;
%     
%     s.Circularity
%     
%     for i = 1:numel(s)
%         
%         if s(s_counter).Circularity >= double(1 - 0.16) && s(s_counter).Circularity <= double(1 + 0.16)
%             
%             circles(circle_count,1) = s(s_counter).Centroid(1);
%             circles(circle_count,2) = s(s_counter).Centroid(2);
%             circle_count = circle_count + 1;
%             circle_count1 = circle_count1 + 1;
%             s_counter = s_counter + 1;
%             
%         elseif s(s_counter).Circularity >= double(pi/4 - 0.16) && s(s_counter).Circularity <= double(pi/4 + 0.16)
%             
%             squares(square_count,1) = s(s_counter).Centroid(1);
%             squares(square_count,2) = s(s_counter).Centroid(2);
%             square_count = square_count + 1;
%             square_count1 = square_count1 + 1;
%             s_counter = s_counter + 1;
%             
%         else
%             
%             triangles(triangle_count,1) = s(s_counter).Centroid(1);
%             triangles(triangle_count,2) = s(s_counter).Centroid(2);
%             triangle_count = triangle_count + 1;
%             triangle_count1 = triangle_count1 + 1;
%             s_counter = s_counter + 1;
%             
%         end
%     end
  
end