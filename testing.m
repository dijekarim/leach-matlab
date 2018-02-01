rng default  % For reproducibility
load kmeansdata
size(X)

idx3 = kmeans(X,3,'Distance','cityblock');
figure
[silh3,h] = silhouette(X,idx3,'cityblock');
h = gca;
h.Children.EdgeColor = [.8 .8 1];
xlabel 'Silhouette Value'
ylabel 'Cluster'