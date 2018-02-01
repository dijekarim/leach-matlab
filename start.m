clc, clear all, close all

numNodes = 100; % number of nodes
p = 0.1;

% newNetwork(x_area, y_area, BS_x, BS_Y)
netArch  = newNetwork(100, 100, 50, 175);
nodeArch = newNodes(netArch, numNodes);
roundArch = newRound(3600);

plot1

par = struct;
numCluster = 6;
lastRCluster = 1;
useOptK = 0;
FND = 0;
HND = 0;
AND = 0;

for r = 1:roundArch.numRound
%     First Nodes Dead
    if nodeArch.numDead == 1
        FND = r;
        FND
    end
    
    if r == 1
        if useOptK == 1
            clusterModel = newCluster(netArch, nodeArch, 'leach', r, p);
        else
            clusterModel = newCluster(netArch, nodeArch, 'leach', r, p, numCluster);
        end
        
        numCluster = clusterModel.numCluster;
        lastRCluster = r + numCluster;
    else
        if useOptK == 1 && lastRCluster == r
            clusterModel = newCluster(netArch, nodeArch, 'leach', r, p);
            numCluster = clusterModel.numCluster;
            lastRCluster = r + numCluster;
        else
            clusterModel = newCluster(netArch, nodeArch, 'leach', r, p, numCluster);
        end
    end
    clusterModel = dissEnergyCH(clusterModel, roundArch);
    clusterModel = dissEnergyNonCH(clusterModel, roundArch);
    nodeArch     = clusterModel.nodeArch; % new node architecture after select CHs
    
    par = plotResults(clusterModel, r, par);
%     Half Nodes Dead
    if nodeArch.numDead == 50
        HND = r;
        HND
    end
    
%     Full Nodes Dead
    if nodeArch.numDead == nodeArch.numNode
        AND = r;
        break
    end
end


