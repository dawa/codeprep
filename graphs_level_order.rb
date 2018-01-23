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
    # @return an array of array of integers
    def levelOrder(a)
      return [] if a.nil?    
      next_to_visit = [a]
      visited = []
      while !next_to_visit.empty?
        next_level = []
        values = []
        next_to_visit.each do |node|
            #  puts "node:#{node.data}"
            values << node.data
            next_level<< node.left if node.left
            next_level << node.right if node.right
        end
        next_to_visit = next_level
        visited << values
      end
      return visited
    end
end

