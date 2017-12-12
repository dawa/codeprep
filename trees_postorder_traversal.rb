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
    def postorderTraversal(a)
        root = a
        result = []
        stack = []

        while true do
            while !root.nil? do
                 # Push root's right child and then root to stack
                 stack.push root.right unless  root.right.nil?
                 stack.push root
     
                 # Set root as root's left child
                 root = root.left
            end 
            # Pop an item from stack and set it as root
            root = stack.pop
     
            # If the popped item has a right child and the
            # right child is not processed yet, then make sure
            # right child is processed before root
            if !root.right.nil? && stack.last == root.right
                stack.pop # Remove right child from stack 
                stack.push root # Push root back to stack
                root = root.right  # change root so that the 
                                   # right child is processed next
            # Else print root's data and set root as None
            else
                result.push root.data
                root = nil
            end
     
            if stack.length <= 0
                    break
            end
        end
        result
    end
end

