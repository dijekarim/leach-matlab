function nodeArch = newNodes(netArch, numNode)
% Create the node model randomly
%   
%   Input:
%       netArch     Network architecture
%       numNode    Number of Nodes in the field
%   Output:
%       nodeArch    Nodes architecture
%       nodesLoc    Location of Nodes in the field
%   Example:
%       netArch  = createNetwork();
%       nodeArch = createNodes(netArch, 100)
%
% Hossein Dehghan, hd.dehghan@gmail.com
% Ver 1. 2/2013

    
    if ~exist('netArch','var')
        netArch = newNetwork();
    end
    
    if ~exist('numNode','var')
        numNode = 100;
    end
    
    genNodes = generateNodesLoc(netArch);
    nodeArch = genNodes;
    nodeArch.numNode = numNode; % Number of Nodes in the field
    nodeArch.numDead = 0; % number of dead nodes
end