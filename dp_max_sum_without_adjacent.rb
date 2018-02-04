class Solution
    # @param a : array of array of integers
    # @return an integer
    def adjacent(a)
        return 0 if a.nil? || a.first.nil?
        n = a.first.size
        current_max = [a[0][0], a[1][0]].max
        prev_max = 0
        
        1.upto(n - 1) do |i|
            temp_max = current_max
            
            index_max =  [a[0][i], a[1][i]].max
            current_max = [current_max, index_max + prev_max].max
            prev_max = temp_max
            # puts "1:#{i} index:#{index_max} current:#{current_max} prev:#{prev_max}"
        end
        
        return [current_max, prev_max].max

    end
end

