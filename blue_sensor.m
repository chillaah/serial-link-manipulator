close all; clear; clc

R = 1;  % reflectance

M = [0; 0; 0; 0.1; 0.6; 0.8; 0.9; 0.7; 0.3; 0; 0; 0; 0];  % spectral response

E = [0.3; 0.5; 0.6; 0.7; 0.6; 0.3; 0.3; 0.2; 0.2; 0.2; 0.1; 0.4; 0.1];  % incident light

% store the result in a called variable 'response'.
r = R .* M .* E;

response = sum(r) * 25 * 10^-9;