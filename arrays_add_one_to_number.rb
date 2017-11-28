class Solution
    # @param a : array of integers
    # @return an array of integers
    def plusOne(a)
        index = a.size - 1
        sum = a[index] + 1
        a[index] = sum
        while sum > 9 do
            a[index] = 0
            index -= 1
            if index < 0
                a.unshift(0)
                index = 0
            end
            sum = a[index] + 1
            a[index] = sum
        end
        while a.first == 0 do
            a = a[1..-1]
        end
        a
    end
end
