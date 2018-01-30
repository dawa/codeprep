class Solution
    # @param a : array of array of integers
    # @return an integer
    def minPathSum(a)
        m = a.size - 1
        n = a.first.size - 1
        
        tc = []
        0.upto(m) do |i|
            tc[i] = []
            0.upto(n) do |j|
                tc[i][j] = 0
            end
        end
        # puts "tc:#{tc.inspect}"
        tc[0][0] = a[0][0]
     
        # Initialize first column of total cost(tc) array
        1.upto(m) do |i|
            tc[i][0] = tc[i-1][0] + a[i][0]
        end
        
        # Initialize first row of tc array
        1.upto(n) do |j|
            tc[0][j] = tc[0][j-1] + a[0][j]
        end
     
        # Construct rest of the tc array
        1.upto(m) do |i|
            1.upto(n) do |j|
                tc[i][j] = [tc[i-1][j], tc[i][j-1]].min + a[i][j]
            end
        end
     
        return tc[m][n]
    end
end

