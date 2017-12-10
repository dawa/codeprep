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
    # @param b : head node of linked list
    # @return the head node in the linked list
    def addTwoNumbers(a, b)
	    prev = nil
	    first = nil
	    remainder = 0
	    sum = 0

	    while !a.nil? || !b.nil? || remainder != 0 do
	        node = ListNode.new(0)
	        sum = remainder

	        first = node if first.nil?
	        prev.next = node unless prev.nil?
	            
	        unless a.nil?
	            sum += a.data
	            a = a.next
	        end

	        unless b.nil?
	            sum += b.data
	            b = b.next
	        end

	        node.data = sum % 10

	        sum /= 10
	        remainder = sum
	        prev = node
	    end

	    return first
    end
end

