function par = plotResults(clusterModel, clusterModel2, r, par)
    nodeArch = clusterModel.nodeArch;
    nodeArch2 = clusterModel2.nodeArch;
    
    %%%%% number of packets sent from CHs to BS
%     if r == 1
%         par.packetToBS(r, 1) = clusterModel.numCluster;
%         par.packetToBS(r, 2) = clusterModel2.numCluster;
%     else
%         par.packetToBS(r, 1) = par.packetToBS(r-1) + clusterModel.clusterNode.countCHs;
%         par.packetToBS(r, 2) = par.packetToBS(r-1) + clusterModel2.clusterNode.countCHs;
%     end
    % Figure packet to BS
%     fig(par.packetToBS, r, 1, '# of packets sent to BS nodes', ...
%         'Number of packet sent to BS vs. round');

    %%%%% Energy
    par.energy(r, 1) = 0;
    node = clusterModel.nodeArch;
    for i = find(~node.dead)
        if node.node(i).energy > 0
            par.energy(r, 1) = par.energy(r, 1) + node.node(i).energy;
        end
    end
    
    par.energy(r, 2) = 0;
    node2 = clusterModel2.nodeArch;
    for i = find(~node2.dead)
        if node2.node(i).energy > 0
            par.energy(r, 2) = par.energy(r, 2) + node2.node(i).energy;
        end
    end
%     fig(par.energy, r, 3, 'sum of energy', 'Sum of energy of nodes vs. round'); 

    %%%%% Average energy
    par.avgEnergy(r, 1) = par.energy(r, 1) / length(~node.dead) ;
    par.avgEnergy(r, 2) = par.energy(r, 2) / length(~node2.dead) ;
    
    %%%%% Number of dead neurons
    par.numDead(r, 1) = nodeArch.numDead;
    par.numDead(r, 2) = nodeArch2.numDead;
    % Figure number of dead node
%     fig(par.numDead, r, 2, '# of dead nodes', 'Number of dead node vs. round');
    
    createfigure(1:r, par.energy, par.avgEnergy, par.numDead);
end
