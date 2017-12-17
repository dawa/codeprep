class Solution
    # @param a : integer
    # @param b : array of integers
    # @return an integer
    def nchoc(a, b)
       result = 0
       return result if b.nil?
       priority_queue = PriorityQueue.new
       size = b.length
       prime = 10**9+7
       
       0.upto(size-1) do |i|
           priority_queue << b[i]
       end
       
       0.upto(a-1) do |i|
           next_number = priority_queue.pop
           result = (result + (next_number % prime)) % prime
           priority_queue << next_number/2
       end
       result
    end
    
    class PriorityQueue
      attr_reader :elements
    
      def initialize
        @elements = [nil]
      end
    
      def <<(element)
        @elements << element
        bubble_up(@elements.size - 1)
      end
    
      def pop
        exchange(1, @elements.size - 1)
        max = @elements.pop
        bubble_down(1)
        max
      end
    
      private
    
      def bubble_up(index)
        parent_index = (index / 2)
    
        return if index <= 1
        return if @elements[parent_index] >= @elements[index]
    
        exchange(index, parent_index)
        bubble_up(parent_index)
      end
    
      def bubble_down(index)
        child_index = (index * 2)
    
        return if child_index > @elements.size - 1
    
        not_the_last_element = child_index < @elements.size - 1
        left_element = @elements[child_index]
        right_element = @elements[child_index + 1]
        child_index += 1 if not_the_last_element && right_element > left_element
    
        return if @elements[index] >= @elements[child_index]
    
        exchange(index, child_index)
        bubble_down(child_index)
      end
    
      def exchange(source, target)
        @elements[source], @elements[target] = @elements[target], @elements[source]
      end
    end
end

