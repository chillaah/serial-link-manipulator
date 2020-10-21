function count = coloured_objects(img)
count = [0 0 0];
format short

R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

intensity = R + G + B;

r = R ./ intensity;
g = G ./ intensity;
b = B ./ intensity;

n = 0;
numR = 0;

for i = 1:size(r,1)
    for j = 1:length(r)
        if r(i, j) > 0.7
            n = n + 1;
        end
        if n == 100
            numR = numR + 1;
            n = 0;
        end
    end
end

l = 0;
numG = 0;

for i = 1:size(g,1)
    for j = 1:length(g)
        if g(i, j) > 0.7
            l = l + 1;
        end
        if l == 100
            numG = numG + 1;
            l = 0;
        end
    end
end

m = 0;
numB = 0;

for i = 1:size(b,1)
    for j = 1:length(b)
        if b(i, j) > 0.7
            m = m + 1;
        end
        if m == 100
            numB = numB + 1;
            m = 0;
        end
    end
end

count = [numR numG numB];
end



% function count = coloured_objects(img)
%         % Your function will be called with img being a RGB (3 channels) image of type double with values between 0 and 1.
%     % You should return the variable count as a 3-vector.
%     % count(1) should be the number of red objects, count(2) the number of green objects, count(3) the number of blue objects
%     
%     count = [0, 0, 0];
%     
%     R = img(:,:,1); % finding the red pixels
%     G = img(:,:,2); % finding the green pixels
%     B = img(:,:,3); % finding the blue pixels
%     
%     intensity = R + G + B;
%     
%     % 21
%     r = R ./ intensity;
%     
%     %max(r)
% 
%     n = 0;
%     numR = 0;
%     
%     for i = 1:size(r, 1)
%         for j = 1:size(r, 2)
%             if r(i, j) > 0.47
%                 n = n + 1;
%                 if n == 289
%                     numR = numR + 1;
%                     n = 0;
%                 end
%             end
%         end
%     end
%     
%     %count(1) = [numR];
%     
%     % 17
%     g = G ./ intensity;
%     
%     o = 0;
%     numG = 0;
%     
%     for i = 1:size(g, 1)
%         for j = 1:size(g, 2)
%             if g(i, j) > 0.44
%                 o = o + 1;
%                 if o == 289
%                     numG = numG + 1;
%                     o = 0;
%                 end
%             end
%         end
%     end
%     
%     %count(2) = [numG];
%     
%     % 26
%     b = B ./ intensity;
%     
%     p = 0;
%     numB = 0;
%     
%     for i = 1:size(b, 1)
%         for j = 1:size(b, 2)
%             if b(i, j) > 0.51
%                 p = p + 1;
%                 if p == 289
%                     numB = numB + 1;
%                     p = 0;
%                 end
%             end
%         end
%     end
%     
%     %count(3) = [numB];
%     
%     %b
%     
%     count = [numR numG numB];% stroing them in a 3 vector array
%     
% end