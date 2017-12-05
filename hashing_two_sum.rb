class Solution
    # @param a : constant array of integers
    # @param b : integer
    # @return an array of integers
    def twoSum(a, b)
        output = []
        return output if a.empty? || b.nil?
        numbers_hash = {}
        
        a.each_with_index do |num, index|
            if numbers_hash[num].nil?
                numbers_hash[num] = [index]
            else
                numbers_hash[num] = numbers_hash[num] << index
            end
        end
        found = {}
        good = false
        0.upto(a.size-1) do |i|
            first = a[i]
            second = b - first
            next if numbers_hash[second].nil?
            numbers_hash[second].each do |j|
                next unless j > i
                good = true
                if found[j].nil?
                    found[j] = [[i+1, j+1]]
                else
                    found[j] = found[j] << [i+1, j+1]
                end
            end
        end
        return found.sort.first[1].first if good
        output            
    end
end

