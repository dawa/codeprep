class Solution
    # @param a : integer
    # @return an integer
    def fibsum(a)
        fib = []
    	count = 0
    	first = 1
    	second = 1
    	
    	while first <= a
    		fib << first
    		temp = first + second
    		first = second
    		second = temp
    	end
    # 	puts "fib:#{fib.inspect}"
    	i = fib.size - 1
    	while i >= 0
    		num = fib[i]
    		while num <= a
    			a = a - num
    			count += 1
    		end
    		break if a == 0
    		i -= 1
        end

    	count
    end
end

