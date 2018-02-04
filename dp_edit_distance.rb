class Solution
    # @param a : string
    # @param b : string
    # @return an integer
    def minDistance(a, b)
        editDistDP(a, b, a.length, b.length)
    end
    
    def editDistDP(str1, str2, m, n)
        # Create a table to store results of subproblems
        dp = []
        0.upto(m) do |i|
            dp[i] = []
            0.upto(n) do |j|
                dp[i][j] = 0
            end
        end

        # Fill d[][] in bottom up manner
        0.upto(m) do |i|
            0.upto(n) do |j|
     
                # If first string is empty, only option is to
                # isnert all characters of second string
                if i == 0
                    dp[i][j] = j    # Min. operations = j

                # If second string is empty, only option is to
                # remove all characters of second string
                elsif j == 0
                    dp[i][j] = i    # Min. operations = i
     
                # If last characters are same, ignore last char
                # and recur for remaining string
                elsif str1[i-1] == str2[j-1]
                    dp[i][j] = dp[i-1][j-1]
     
                # If last character are different, consider all
                # possibilities and find minimum
                else
                    dp[i][j] = 1 + [dp[i][j-1],          # Insert
                                    dp[i-1][j],          # Remove
                                    dp[i-1][j-1]].min    # Replace
                end
            end
        end
        # puts "DP:#{dp.inspect}"
        return dp[m][n]
    end
    
    def editDistance(str1, str2, m , n)
        # If first string is empty, the only option is to
        # insert all characters of second string into first
        return n if m == 0
     
        # If second string is empty, the only option is to
        # remove all characters of first string
        return m if n == 0
     
        # If last characters of two strings are same, nothing
        # much to do. Ignore last characters and get count for
        # remaining strings.
        if str1[m-1] == str2[n-1]
            return editDistance(str1,str2,m-1,n-1)
        end
        # If last characters are not same, consider all three
        # operations on last character of first string, recursively
        # compute minimum cost for all three operations and take
        # minimum of three values.
        return 1 + [editDistance(str1, str2, m, n-1),    # Insert
                       editDistance(str1, str2, m-1, n),    # Remove
                       editDistance(str1, str2, m-1, n-1)    # Replace
                       ].min
    end
end

