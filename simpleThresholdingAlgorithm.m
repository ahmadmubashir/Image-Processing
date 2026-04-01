function binaryImage = simpleThresholdingAlgorithm(image, initialThreshold, deltaT)
  
    grayImage = rgb2gray(image);
    
   
    T = initialThreshold;
    Tnew = 0;
    
    
    while abs(T - Tnew) > deltaT
        
        G1 = grayImage > T;  
        G2 = grayImage <= T; 
        
        
        m1 = mean(grayImage(G1));
        m2 = mean(grayImage(G2));
        
        
        Tnew = (m1 + m2) / 2;
        
       
        T = Tnew;
    end
    
   
    binaryImage = grayImage > T;
    
    figure;
    subplot(1, 2, 1);
    imshow(grayImage);
    title('Original Grayscale Image');
    
    subplot(1, 2, 2);
    imshow(binaryImage);
    title('Thresholded Image');
end

