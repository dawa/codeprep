class Solution
    # @param a : constant array of integers
    # @param b : integer
    # @return an integer
    def kthsmallest(a, b)
        number_counts = {}
        a.each do |num|
            number_counts[num] = number_counts[num].to_i + 1
        end
        count = 0
        last = 0
        # puts number_counts.sort.inspect
        number_counts.sort.each do |key, value|
            count += value
            return key if b <= count
            last = key
            # puts "count: #{count}, last: #{last}"
        end
        return last
    end
end

