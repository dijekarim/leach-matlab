clc, clear all, close all

numNodes = 100; % number of nodes
p = 0.1;

% newNetwork(x_area, y_area, BS_x, BS_Y)
netArch  = newNetwork(100, 100, 50, 175);
nodeArch = newNodes(netArch, numNodes);
nodeArch2 = nodeArch;
roundArch = newRound(3000);

plot1

par = struct;
numCluster = 5;
FND = 0; FND2 = 0;
HND = 0; HND2 = 0;
AND = 0; AND2 = 0;

for r = 1:roundArch.numRound
%     First Nodes Dead
    if nodeArch.numDead == 1
        FND = r;
        FND
    end
    if nodeArch2.numDead == 1
        FND2 = r;
        FND2
    end

    % clusterModel for LEACH
    clusterModel = newCluster(netArch, nodeArch, 'leach', r, p, numCluster);
    clusterModel = dissEnergyCH(clusterModel, roundArch);
    clusterModel = dissEnergyNonCH(clusterModel, roundArch);
    nodeArch     = clusterModel.nodeArch; % new node architecture after select CHs
    
    % clusterModel2 for modified LEACH-OptK
    clusterModel2 = newCluster(netArch, nodeArch2, 'leachUpdated', r, p);
    clusterModel2 = dissEnergyCH(clusterModel2, roundArch);
    clusterModel2 = dissEnergyNonCH(clusterModel2, roundArch);
    nodeArch2     = clusterModel2.nodeArch; % new node architecture after select CHs
    
    par = plotResults(clusterModel, clusterModel2, r, par);
%     Half Nodes Dead
    if nodeArch.numDead == 50
        HND = r;
        HND
    end
    if nodeArch2.numDead == 50
        HND2 = r;
        HND2
    end
    
%     Full Nodes Dead Check
    if nodeArch.numDead == nodeArch.numNode
        AND = r;
        AND
    end
    if nodeArch2.numDead == nodeArch2.numNode
        AND2 = r;
        AND2
    end
    
%     Full Nodes Dead for all algorithm
    if nodeArch.numDead == nodeArch.numNode && nodeArch2.numDead == nodeArch2.numNode
        break
    end
end


