clear; close all; clc

function img = load_and_convert(filename)

    % Code your answer below
    
    image = imread(filename);
    image = rgb2gray(image);
    image = double(image);
    
    histogram(image, 'BinLimits', [0 255], 'BinWidth' ,1);
    
    
end