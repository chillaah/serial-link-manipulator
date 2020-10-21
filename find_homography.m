function H = find_homography(filename)

    img = imread(filename);
    
    % modified centroids algorithm to calcualte center of centroids
    
    B = img(:, :, 3);
    
    RG = img - B;

    b = img - RG;

    segment = b(:, :, 3);

    diff = segment - b;

    greydiff = rgb2gray(diff);
    
    binary = imbinarize(greydiff);

    s = regionprops('table', binary, 'Centroid', 'MajorAxisLength', 'MinorAxisLength');
    
    centroids = cat(1, s.Centroid);

    whole = cat(1, s.MajorAxisLength);
    
    [ ~ , Z ] = max(whole);

    startpoint = centroids(Z , :);
    
    changex = centroids(:,1) - startpoint(1);
    
    changey = centroids(:,2) - startpoint(2);
    
    change  = sqrt((changex).^2 + (changey).^2);
    
    withrespect = change / max(change);
    
    pos = withrespect;
    
    val0 = 0;
    
    val1 = 1;
    
    val2 = 2;
    
    val3 = 3;
    
    val4 = 4;
    
    val5 = 5;
    
    for k = 1:length(centroids)
        
        if withrespect(k) < 0.4
            
            pos(k) = val1;
           
        end
        
        if withrespect(k) > 0.4 && withrespect(k) < 0.55
            
            pos(k) = val2;
            
        end
        
        if withrespect(k) > 0.55 && withrespect(k) < 0.76
            
            pos(k) = val3;
            
        end
        
        if withrespect(k) > 0.76 && withrespect(k) < 0.85
            
            pos(k) = val4;
            
        end
        
        if withrespect(k) == 1
            
            pos(k) = val5;

        end 
        
        if k == Z
            
           pos(k) = val0; 
           
        end
        
    end

    sum1 = 0;
    
    sum2 = 0;
    
    sum3 = 0;
    
    for k = 1:length(centroids)
        
        if pos(k) == 1
            
            if sum1 == 1
                
               pos(k) = 2.5;
               
            else
                
                sum1 = sum1 + 1;
                
            end
            
        end

        if pos(k) == 3
            
            if sum2 == 1
                
               pos(k) = 7;
               
            else
                
                sum2 = sum2 + 1;
                
            end
            
        end
        
        if pos(k) == 4
            
            if sum3 == 1
                
                pos(k) = 6;
                
            else
                
                sum3 = sum3 + 1;
                
            end
            
        end
        
    end
    
    [ ~ , label ] = sort(pos);
    
    coordinates = centroids;
    
    for k = 1:length(centroids)
        
        coordinates(k, 1) = centroids(label(k), 1);
        
        coordinates(k, 2) = centroids(label(k), 2);
        
    end 

    P = coordinates';
    
    Q = [ 0,    0 ;
        
          0,  250 ;
          
          250, 250;
          
          250,   0;
          
          0,   500;
          
          250, 500;
          
          500, 500;
          
          500, 250;
          
          500,   0 ];
     
    Q = Q';
  
    H = simple_homography(P,Q);

end