function kOpt = clusterOptimum(netArch, nodeArch, dBS)
% calculate the optimum valuse for number of nodes
%
%   Input:
%       netArch     network model
%       nodeArch    nodes model
%       dBS         length from base station
%   Example:
%       dBS = sqrt(netArch.Sink.x ^ 2 + netArch.Sink.y ^ 2);
%       numClusters     = clusterOptimum(netArch, nodeArch, dBS);
%
%
% Hossein Dehghan, hd.dehghan@gmail.com
% Ver 1. 2/2013
    
    % define cluster structure
    clusterNode     = struct();
    %
    locAlive = find(~nodeArch.dead); % find the nodes that are alive
    countCHs = 1;
    for i = locAlive % search in alive nodes
        clusterNode.no(countCHs)       = i; % the no of node
        xLoc = nodeArch.node(i).x; % x location of alive nodes
        yLoc = nodeArch.node(i).y; % y location of alive nodes
        clusterNode.loc(countCHs, 1)   = xLoc;
        clusterNode.loc(countCHs, 2)   = yLoc;
        countCHs = countCHs+1;
    end % for
    clusterNode.countCHs = countCHs;
    
    E = evalclusters(clusterNode.loc(:,1:2),'kmeans','silhouette','klist',[1:10]);
    kOpt = E.OptimalK;

%     N    = nodeArch.numNode; % number of nodes
%     M    = sqrt(netArch.Yard.Length * netArch.Yard.Width);
%     kOpt = sqrt(N) / sqrt(2*pi) * ...
%            sqrt(netArch.Energy.freeSpace / netArch.Energy.multiPath) * ...
%            M / dBS ^ 2;
%     kOpt = round(kOpt);
end