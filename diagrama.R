library(DiagrammeR)

grViz("
      digraph boxes_and_circles {
      node[shape = circle, fillcolor= grey,fontsize = 12, fixedsize = true,
        width = 0.9]
      graph[rankdir=LR, overlap = true]
     
      seed;small;big    
      
      seed->small[label='P_21',fontsize = 8]; small->big [label='P_32',fontsize = 8]; big->seed[label='F3',fontsize = 8]; small->seed[label='F2',fontsize = 8]; big->big [label='P_33',fontsize = 8]
           
             }
       ")

nodes <-
  create_nodes(nodes = c("a", "b", "c"),
               label = c("seed", "small", "big"),
               type = "LR",
               style = "filled",
               color = "grey",
               shape = "circle",
               data = c(3.5, 2.6, 9.4, 2.7))

edges <-
  create_edges(from = c("a", "b", "c", "b", "c"),
               to = c("b", "c", "c", "a", "a"),
               relationship = "leading_to", 
               label=c("P21", "P31", "P33","F2","F3"))


graph <-
  create_graph(nodes_df = nodes,
               edges_df = edges,
               graph_attrs= "rankdir=LR, outputorder = edgesfirst",
               node_attrs = "fontname = Helvetica, fixedsize = true,
        width = 0.6, fontsize=10",
               edge_attrs = c("color = black",
                              "arrowsize = 0.8" , "fontsize = 8"))

visnetwork(graph, height = 3, width = 6)

graph
render_graph(graph)

