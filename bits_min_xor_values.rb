class Solution
    # @param a : array of integers
    # @return an integer
    def findMinXor(a)
      min_val = 100000
      a = a.sort
      len = a.size
      a.each_with_index do |num, i|
          next if i == len - 1
          #puts "min:#{min_val} num:#{num} j:#{j} a[j]:#{a[j]} XOR:#{num ^ a[j]}"
          min_val = [min_val, (num ^ a[i + 1])].min
      end
      min_val
    end
end

