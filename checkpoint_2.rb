class Solution
    # @param a : integer
    # @return an array of array of integers
    def prettyPrint(a)
        size = (a*2)-2
        result = []
        0.upto(size) do |row|
            output = []
            0.upto(size) do |column|
                output << a - [row, column, size-row, size-column].min
            end
            result << output
        end
        result
    end
end

