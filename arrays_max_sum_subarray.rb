class Solution
    # @param a : constant array of integers
    # @return an integer
    def maxSubArray(a)
       return_value = 0
       sum = 0
       max_value = a.first
       positive = false
       a.each_with_index do |item, index|
           positive |= item > 0
           max_value = [max_value, item].max

           if sum + item > 0
               sum += item
           else
               sum = 0
           end
           return_value = [return_value, sum].max
       end
       positive ? return_value : max_value
    end
end
