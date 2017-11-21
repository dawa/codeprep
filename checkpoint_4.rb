# Definition for singly-linked list.
# class ListNode
#     attr_accessor :next,:data
#     def initialize(data)
#         @data = data
#         @next=nil
#     end
# end

class Solution
    # @param a : head node of linked list
    # @return the head node in the linked list
    def subtract(a)
      size = 0    
      node = a
      values = []
      while(node != nil)
        size += 1
        values.unshift(node.data)
        node = node.next
      end
      node = a
      values.each_with_index do |value, index|
        break if index + 1 > size/2
        node.data = value - node.data
        # puts "index: #{index} value: #{value} data: #{node.data}"
        node = node.next
      end
      a
    end
end

