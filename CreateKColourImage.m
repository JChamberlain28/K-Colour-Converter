function [finalImage] = CreateKColourImage(clusters, finalMeans)
% CreateKColourImage.m creates an image with reduced colours calculated
% through the K means algorithm. It assigns each point in the RGB image
% array with a red, green and blue value according to its associated
% cluster.
% Inputs:   clusters = assigned clusters for each point in an image array
%           finalMeans = RGB means calculated by the KMeansRGB.m
%                        function
% Outputs:  finalImage = 3D RGB image array
% Author: Jack Chamberlain


[imRow, imCol] = size(clusters);

% pre allocation of final image array
finalImage = zeros(imRow, imCol, 3, 'uint8');


% cycles through every point in image, setting its colour
for j = 1:imRow
    
    for i=1:imCol
        % obtains the mean colour to use for the current point in the image
        currentCluster = clusters(j,i);
        % assignes colour to point in image
        finalImage(j,i,:) = finalMeans(currentCluster,1,:);
    end
    
end



end