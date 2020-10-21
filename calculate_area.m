function a = calculate_area(H)
    % Given Homography H, return the area of the triangle with image vertices (640, 650), (590,800), and (540, 650)
    % H is defined from image coordinates to world coordinates.

    B = [ 640, 650; 
          590, 800;
          540, 650 ];

    B_1 = [ 640;
            650;
              1 ];
     
    B_2 = [ 590;
            800;
              1 ];
     
    B_3 = [ 540;
            650;
              1 ];
          
    Homography = H;
    
    area_1 = Homography * B_1;
    
    area_2 = Homography * B_2;
    
    area_3 = Homography * B_3;
    
    area_3i = area_3(1) / area_3(3);
    
    area_3j = area_3(2) / area_3(3);
    
    area_2i = area_2(1) / area_2(3);
    
    area_2j = area_2(2) / area_2(3);
    
    area_1i = area_1(1) / area_1(3);
    
    area_1j = area_1(2) / area_1(3);
    
    area_i = [ area_1i, area_2i, area_3i ];
    
    area_j = [ area_1j, area_2j, area_3j ];
    
    % calculating final area
    
    a = polyarea(area_i, area_j);
    
end