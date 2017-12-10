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
    def reorderList(a)
        # Find the middle point using tortoise and hare method 
        slow = a
        fast = slow.next
        while !fast.nil? && !fast.next.nil? do
            slow = slow.next
            fast = fast.next.next
        end
 
        # Split the linked list in two halves
        # node1, head of first half    1 -> 2 -> 3
        # node2, head of second half   4 -> 5
        node1 = a
        node2 = slow.next
        slow.next = nil
 
        # Reverse the second half, i.e., 5 -> 4
        node2 = reverse_list(node2)
 
        # Merge alternate nodes
        a = ListNode.new(0)
 
        # curr is the pointer to this dummy Node, which will
        # be used to form the new list
        curr = a
        while !node1.nil? || !node2.nil? do
            # First add the element from first list
            if !node1.nil?
                curr.next = node1
                curr = curr.next
                node1 = node1.next
            end
 
            # Then add the element from second list
            if !node2.nil?
                curr.next = node2
                curr = curr.next
                node2 = node2.next
            end
        end
 
        # Assign the head of the new list to head pointer
        a = a.next
    end
    
    def reverse_list(node)
        prev = nil
        curr = node
        temp = nil
        while !curr.nil? do
            temp = curr.next
            curr.next = prev
            prev = curr
            curr = temp
        end
        node = prev
        node
    end
end

