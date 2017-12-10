# Complete the function below.

#For your reference:
#LinkedListNode {
#    int val
#    LinkedListNode next
#}

def removeNodes(list, x) 
        return list if list.nil?
        head = list
        prev = nil
        curr = head
        while !curr.nil? do
            if curr.val > x
                if prev
                    prev.next = curr.next
                else
                    head = curr.next
                end
            else    
                prev = curr
            end
            curr = curr.next
        end
        return head
end


