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
    # @return the root node in the tree
    def invertTree(a)
        current = a
        return if current.nil?
        temp = current.right
        current.right = current.left
        current.left = temp
        invertTree(current.right)
        invertTree(current.left)
        a
    end
end

