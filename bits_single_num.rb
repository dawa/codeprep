class Solution
    # @param a : constant array of integers
    # @return an integer
    def singleNumber(a)
      result = 0    
      a.each do |num|
          result = result ^ num
      end
      result
    end
end

