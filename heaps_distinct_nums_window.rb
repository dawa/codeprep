class Solution
    # @param a : array of integers
    # @param b : integer
    # @return an array of integers
    def dNums(a, b)
        result = []
        count = 0
        memo = {}
        # Traverse the first window and store count
        # of every element in hash map
        0.upto(b-1) do |i|
            if memo[a[i]].nil?
                memo[a[i]] = 1
                count += 1
            else
               memo[a[i]] = memo[a[i]] + 1
            end
        end
 
        # Print count of first window
        result.push count
 
        # Traverse through the remaining array
        b.upto(a.length-1) do |i|
            # Remove first element of previous window
            # If there was only one occurrence, then
            # reduce distinct count.
            if memo[a[i-b]] == 1
                memo[a[i-b]] = nil
                count -= 1
            else # reduce count of the removed element
               memo[a[i-b]] = memo[a[i-b]] - 1
            end
 
            # Add new element of current window
            # If this element appears first time,
            # increment distinct element count
            if memo[a[i]].nil?
                memo[a[i]] = 1
                count += 1
            else # Increment distinct element count
               memo[a[i]] = memo[a[i]] + 1
            end
 
            # Print count of current window
            result.push count
        end
        result
    end
end

