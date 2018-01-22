class Solution
    # @param a : array of integers
    # @return an array of array of integers
    def permute(a)
        result = []
	    permuter(a, 0, result);
	    result;
    end
 
    def permuter(num, start, result)
    	result << num.compact if start >= num.length

    	start.upto(num.length - 1) do |j|
    		swap(num, start, j)
    		permuter(num, start + 1, result)
    		swap(num, start, j)
    	end
    end
     
    def swap(a, i, j)
    	temp = a[i]
    	a[i] = a[j]
    	a[j] = temp
    end
end

