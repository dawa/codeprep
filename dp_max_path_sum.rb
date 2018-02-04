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
    # @return an integer
    def maxPathSum(a)
        # Initialize result
        @max_sum = a.data
         
        # Compute and return result
        maxPathSumRec(a)
        
        return @max_sum
    end
    
    def maxPathSumRec(root)
        # Base Case
        return 0 if root.nil?
     
        # l and r store maximum path sum going through left 
        # and right child of root respetively
        l = maxPathSumRec(root.left)
        r = maxPathSumRec(root.right)
         
        # Max path for parent call of root. This path 
        # must include at most one child of root
        max_single = [[l, r].max + root.data, root.data].max
         
        # Max top represents the sum when the node under
        # consideration is the root of the maxSum path and
        # no ancestor of root are there in max sum path
        max_top = [max_single, l+r+ root.data].max
     
        # Static variable to store the changes
        # Store the maximum result
        @max_sum = [@max_sum, max_top].max
     
        return max_single
    end
 end

