describe "RedBlackTree", ->
# 1. Each node is either 'red' or 'black'
# 2. Root is always 'black'
# 3. Every red node must have 2 black children
#    (all red nodes have a black parent)
# 4. Every root-null path passes through same number of black nodes
