# Definition for a  binary tree node
# class TreeNode
#     attr_accessor :left,:right,:data
#     def initialize(data)
#         @data = data
#         @left = nil
#         @right = nil
#     end
# end
class Solution
    # @param a : root node of tree
    # @return an array of integers
    def inorderTraversal(a)
        current = a
        result = []
        stack = []
        done = false  
        while !done do
            # Reach the left most Node of the current Node
            if !current.nil?
                # Place pointer to a tree node on the stack 
                # before traversing the node's left subtree
                stack.push current
                current = current.left 
     
            # BackTrack from the empty subtree and visit the Node
            # at the top of the stack; however, if the stack is 
            # empty you are done
            else
                if stack.length > 0
                    current = stack.pop
                    result.push current.data
             
                    # We have visited the node and its left 
                    # subtree. Now, it's right subtree's turn
                    current = current.right 
     
                else
                    done = true
                end
            end
        end
        result
    end
end

