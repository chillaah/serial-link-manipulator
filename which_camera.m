close all; clear; clc

% Store the pixel coordinates of the projected corner points of the workspace in carthesian form in X.
% Make sure you carefully read the problem description and the instructions. Extract the necessary information from the linked resources.

f = 0.0028; % focal length in meters

u_0 = 644; % u-coordinate of image plane centre

v_0 = 364; % v-coordinate of image plane centre

sigma = 4.08 * 10^-6; % physical pixel dimension, width and height

Z = 2; % height from the paper is 2m

first  = [1/sigma 0 u_0; 0 1/sigma v_0; 0 0 1];

second  = [f 0 0 0; 0 f 0 0; 0 0 1 0];

TL  = [-1; -1; Z; 1];

TR = [ 1; -1; Z; 1];

BR = [1; 1; Z;  1];

BL = [-1; 1; Z;  1];

Cone = first * second * TL;

Ctwo = first * second * TR;

Cthree = first * second * BR;

Cfour = first * second * BL;


Cfirst = Cone./Cone(3);

Csecond = Ctwo./Ctwo(3);

Cthird = Cthree./Cthree(3);

Cfourth = Cfour./Cfour(3);


Y = [Cone Ctwo Cthree Cfour];

X = [Cfirst Csecond Cthird Cfourth];

X(3,:) = [];