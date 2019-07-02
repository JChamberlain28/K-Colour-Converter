function [clusters] = AssignToClusters(imageArray, colours)
% AssignToClusters.m assignes each point in the image to the mean point it
% most closely represents.
% Inputs:   imageArray = 3D Image Array (RGB format)
%           colours = 3D array of colour data
% Outputs:  clusters = assigned clusters for each point in an image array
% Author: Jack Chamberlain


% imageArray must be double to preform distance calculations or the
% distance array will default to uint8, meaning large distances would not
% work
imageArray = double(imageArray);


% Seperates the Red, Green and Blue layers of the image
P1 = imageArray(:,:,1);
P2 = imageArray(:,:,2);
P3 = imageArray(:,:,3);

Q = colours;


[imRows, imCols, ~] = size(imageArray);
[k, ~, ~] = size(colours);

% pre allocates the distanceLayers matrix for speed
distanceLayers = zeros(imRows, imCols, k);

% calculates the distance for every point in the image and the current k
% point. Results in k layers being created in distanceLayers
for i = 1:k
    distanceLayers(:,:,i) = ((P1-Q(i,1,1)).^2)...
        +((P2-Q(i,1,2)).^2)+((P3-Q(i,1,3)).^2);
end


% find the layer location of each min distance and assign it to the same
% row and column position in the clusters array as it resides in the
% distanceLayers array
[~, clusters] =  min(distanceLayers, [], 3);

end
