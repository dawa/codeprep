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
    # @param b : root node of tree
    # @return an integer
    def isSameTree(a, b)
        compareTrees(a,b) ? 1 : 0
    end
    
    def compareTrees(a,b)
       return 1 if a.nil? && b.nil?
       if !a.nil? && !b.nil?
           return (a.data == b. data && compareTrees(a.left, b.left) && compareTrees(a.right, b.right))
       end
    end        
end

