class Solution
    # @param a : head node of linked list
    # @return the head node in the linked list
    def swapPairs(a)
      return a if a.nil? || a.next.nil?    
      previous = a    
      current = a.next
      head = current
      while true do
        next_node = current.next
        current.next = previous
 
        if next_node.nil? || next_node.next.nil?
            previous.next = next_node
            break
        end
 
        previous.next = next_node.next
        previous = next_node
        current = previous.next;
      end
      head
    end
end

