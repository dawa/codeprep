# Definition for a undirected graph node
# class UndirectedGraphNode:
#     def __init__(self, x):
#         self.label = x
#         self.neighbors = []

class Solution:
    # @param node, a undirected graph node
    # @return a undirected graph node
    def cloneGraph(self, node):
        q = [];
        q.append(node);
 
        # An HashMap to keep track of all the
        # nodes which have already been created
        hm = {};
 
        # Put the node into the HashMap
        hm[node] = UndirectedGraphNode(node.label);
 
        while q:
            #  Get the front node from the queue
            #  and then visit all its neighbours
            u = q.pop(0);
 
            #  Get corresponding Cloned Graph Node
            cloneNodeU = hm[u];
            if u.neighbors:
                for graph_node in u.neighbors:
                    #  Get the corresponding cloned node
                    #  If the node is not cloned then we will
                    #  simply get a null
                    cloneNodeG = hm.get(graph_node, None);
 
                    #  Check if this node has already been created
                    if cloneNodeG is None:
                        q.append(graph_node);
 
                        #  If not then create a new Node and
                        #  put into the HashMap
                        cloneNodeG = UndirectedGraphNode(graph_node.label);
                        hm[graph_node] = cloneNodeG;

                    #  add the 'cloneNodeG' to neighbour
                    #  vector of the cloneNodeG
                    cloneNodeU.neighbors.append(cloneNodeG);

        #  Return the reference of cloned source Node
        return hm[node];

