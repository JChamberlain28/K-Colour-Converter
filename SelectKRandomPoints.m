function [kPoints] = SelectKRandomPoints(imageArray, k)
% SelectKRandomPoints.m selects a specified ammount of random points in an
% image array and puts them in an output array
% Inputs:    imageArray = 3D Image Array (RGB format)
%                k = Number of points to randomly select
% Outputs:   kPoints = Array of randomly selected points
% Author: Jack Chamberlain


[imageRows, imageCols, ~] = size(imageArray);

% finds total positions in image array
totalIndex = imageRows*imageCols;

% generats k index locations in the immage array with no repetition
pointIndex = randperm(totalIndex,k);

% retrieves row and column positions for respective index points
[kPointsRows, kPointsCols] = ind2sub([imageRows, imageCols], pointIndex);

% appends new points to the kPoints array
kPoints = [kPointsRows' kPointsCols'];

end