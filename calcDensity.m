function density = calcDensity(D,scale,sides,partitions)
%% calcDensity
% Calculates the density matrix for the given iteration
%
% Parameters:
%   D
%     Symbolic function of x, y, t, or matrix of symbolic functions of t
%   iteration
%     The current iteration
%   (optional) sides
%     Side length of the arena
%   (optional) partitions
%     Number of subdivisions within each unit length of the arena
%
% Returns:
%   density
%     (sides*partitions)-by-(sides*partitions) matrix of doubles
%     representing discretized density for the given iteration

    M = readmatrix('DistributionMatrix.xlsx','Sheet','Sheet1','Range','A1:CV100');
    density = D;
    scaleFactor = scale;

    for i = 1:sides*partitions
        for j = 1:sides*partitions
            percentage = M(i,j) * scaleFactor;
            chance = rand;
            if (chance < percentage)
                density(i,j) = density(i,j) + 1;
            end
        end
    end

end