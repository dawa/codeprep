class Solution
    # @param a : integer
    # @return an integer
    def climbStairs(a)
      return 1 if a == 1
      return 2 if a == 2
      
      #minus_one = @stairs[a-1].nil? ? @stairs[a-1] = climbStairs(a - 1) : @stairs[a-1]
      #minus_two = @stairs[a-2].nil? ? @stairs[a-2] = climbStairs(a - 2) : @stairs[a-2]
      
      return  climbStairs(a - 1) + climbStairs(a - 2)
    end
    # @stairs = {}
end

