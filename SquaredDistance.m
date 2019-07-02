function [distance] = SquaredDistance(P, Q)
% SquaredDistance.m finds the square of the straight line distance between
% 2 points in 3d space.
% Inputs:   P = Point 1
%           Q = Point 2
% Outputs:  distance = squared distance between point P and point Q
% Author: Jack Chamberlain



% converts 8 bit int array P, to double to prevent distance
% values defaulting to 8 bit int. Thus allowing large square distances
P = double(P);

% squared distance formula utalising array element operations
distance = sum((P-Q).^2);
end