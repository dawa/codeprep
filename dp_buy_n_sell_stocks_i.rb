class Solution
    # @param a : constant array of integers
    # @return an integer
    def maxProfit(a)
        n = a.size
        # Prices must be given for at least two days
        return 0 if n <= 1
         
        max_diff = a[1] - a[0]
     
        min_element = a[0]
     
        1.upto(n - 1) do |i|
            if a[i] - min_element > max_diff
                max_diff = a[i] - min_element
            end
            if a[i] < min_element
                min_element = a[i]
            end
        end
        
        return [max_diff, 0].max
    end
end





