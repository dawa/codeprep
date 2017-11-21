class Solution
    # @param a : array of integers
    # @return an array of array of integers
    def permute(a)
        result = []
    	permuting(a, 0, result)
    	return result.uniq
    end
    
    def permuting(num, start, result)
    	if start >= num.length
    		item = convertArrayToList(num)
    		result << item
    	end
     
    	start.upto(num.length - 1) do |j|
    		swap(num, start, j)
    		permuting(num, start + 1, result)
    		swap(num, start, j)
    	end
    end
 
    def convertArrayToList(num)
    	item = []
    	0.upto(num.length-1) do |h|
    		item << num[h]
    	end
    	return item
    end
 
    def swap(a, i, j)
    	temp = a[i]
    	a[i] = a[j]
    	a[j] = temp
    end
end

