class Solution
    # @param a : constant array of integers
    # @return an integer
    def lis(a)
        n = a.size - 1
 
        # Declare the list (array) for LIS and initialize LIS
        # values for all indexes
        lis = []
        0.upto(n) do |i|
            lis[i] = 1
        end
     
        # Compute optimized LIS values in bottom up manner
        1.upto(n) do |i|
            0.upto(i) do |j|
                if a[i] > a[j] && lis[i] < lis[j] + 1
                    lis[i] = lis[j]+1
                end
            end
        end
     
        # Initialize maximum to 0 to get the maximum of all
        # LIS
        maximum = 0
     
        # Pick maximum of all LIS values
        0.upto n do |i|
            maximum = [maximum , lis[i]].max
        end
        
        return maximum
    end
end

