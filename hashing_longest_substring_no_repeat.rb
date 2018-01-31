class Solution
    # @param a : string
    # @return an integer
    def lengthOfLongestSubstring(a)
      longest = 0
      repeat_index = -1
      memo = {}
      0.upto(a.size-1) do |i|
        if memo[a[i]] && repeat_index < memo[a[i]]
          repeat_index = memo[a[i]]
        end
        longest = [longest, i-repeat_index].max
        memo[a[i]]=i
      end
      longest    
    end
end

