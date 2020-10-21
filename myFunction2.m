function x = myFunction2(H, P)
 % Given Homography H (from image to work surface)
 % and a point P on the work surface, calculate the image of P 
 % and return its carthesian coordinates as a 2-vector
 
    % homography invert
    
    Homo = H^(-1);
    
    B = Homo * [ P;
        
                 1 ];
    
    x = [ B(1)/B(3);
        
          B(2)/B(3) ];

end