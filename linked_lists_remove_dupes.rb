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
    def deleteDuplicates(a)
      head = a    
      while !a.nil? && !a.next.nil? do
          # puts "data: #{a.data} next:#{a.next.data}"
          if a.data == a.next.data
              a.next = a.next.next
          else
            a = a.next
          end
      end
      head
    end
end
