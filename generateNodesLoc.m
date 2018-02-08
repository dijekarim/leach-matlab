function genNodes = generateNodesLoc(netArch, numNodes)
    % generate data nodes location
    %
    data = [
       97.3679   73.4797
       75.2386    3.3314
       11.7606   26.1303
       89.3358   97.2061
       99.4074   34.6786
       29.2302   18.7247
       74.3148   71.8019
       18.8895   43.3938
        4.5593   65.5473
       78.1042   86.2900
       78.5353   43.3492
       34.7821    5.5389
       81.9441   10.6040
        0.6074   27.5042
       94.2771   67.4259
       38.5658   85.6946
       67.4825   60.8097
       43.9426   96.1285
       82.2906    1.0499
       14.1617   48.2810
       58.0618   29.2989
       43.8867   39.8265
       13.7305   95.2762
       36.0045   83.6977
        4.1336   42.3831
        7.5638   31.3815
       94.5983   85.4503
       17.3531   53.5884
       29.4889   90.2872
        8.1387   78.7475
       17.4408   71.9988
       23.2007   20.7137
       21.6132   97.6671
       38.1849   63.5289
        4.6564   23.2068
       87.4840   46.0143
        0.3064   46.4941
       82.4072   87.1886
       30.1075   23.6005
       83.1578   43.7753
       50.7087   18.5475
       15.1499   90.6806
       99.2750   39.0081
       82.6811   95.4058
       89.3842   84.1006
       68.3284   17.1796
       23.7551   43.4285
        2.5062   26.8647
       98.0159   31.2692
       57.1752   61.1663
       90.1538   39.6040
       69.2767   20.4486
        6.2853   62.2386
       68.8020   29.6785
       57.1562   31.6223
       80.9498   36.5498
       69.8790   63.3426
       96.4579   20.0797
       59.8178    8.3703
       54.4415   84.6149
        4.0698   32.9360
       70.9350   86.0311
       50.0899   99.4760
       42.8640   26.7345
       47.2952   16.0845
       15.8898   26.8342
       75.7120   60.9174
       96.6933   77.3321
       57.2865   45.0224
       28.7057   75.2387
        9.4358   10.6786
       73.4894   35.4592
       58.0634   29.8855
       71.3681   36.0486
       71.8460   99.5324
        8.3700   46.8206
        9.3803   72.5170
       91.2045    8.6414
       51.9951   55.2631
       68.5149   29.9655
       60.1878   19.8504
       65.6757   69.8357
       45.9680   15.7659
       42.1786   59.6054
       32.2331   83.0729
       12.2685   25.1181
       93.7608   65.5208
       75.2911   81.0859
        4.8427   41.4709
       72.5489   13.9044
       63.2557   24.6833
       83.9972   83.6671
       45.3072   39.4759
       96.1595    0.8178
       39.8439   48.7772
       61.8137    7.0010
       14.2688   65.4227
       21.8320   11.9132
        4.3137   16.5558
       51.1106   86.7268
    ];
    
    if ~exist('numNodes','var')
        for i = 1:100
             % x cordination of node
             genNodes.node(i).x      =   data(i, 1);
             genNodes.nodesLoc(i, 1) =   genNodes.node(i).x;
             % y cordination of node
             genNodes.node(i).y      =   data(i, 2);
             genNodes.nodesLoc(i, 2) =   genNodes.node(i).y;
             % the flag which determines the value of the indicator function? Ci(t)
             genNodes.node(i).G      =   0; 
             % initially there are no cluster heads, only nodes
             genNodes.node(i).type   =   'N'; % 'N' = node (nun-CH)
             genNodes.node(i).energy =   netArch.Energy.init;

             genNodes.node(i).CH     = -1; % number of its CH ?
             genNodes.dead(i)        = 0; % the node is alive
        end
    else
        for i = 1:numNodes
             % x cordination of node
             genNodes.node(i).x      =   rand * netArch.Yard.Length;
             genNodes.nodesLoc(i, 1) =   genNodes.node(i).x;
             % y cordination of node
             genNodes.node(i).y      =   rand * netArch.Yard.Width;
             genNodes.nodesLoc(i, 2) =   genNodes.node(i).y;
             % the flag which determines the value of the indicator function? Ci(t)
             genNodes.node(i).G      =   0; 
             % initially there are no cluster heads, only nodes
             genNodes.node(i).type   =   'N'; % 'N' = node (nun-CH)
             genNodes.node(i).energy =   netArch.Energy.init;

             genNodes.node(i).CH     = -1; % number of its CH ?
             genNodes.dead(i)        = 0; % the node is alive
        end
    end
end