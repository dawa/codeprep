def countNumbers(arr)
    memo = {}
    
    arr.each do |pair|
        count = 0
        pair.first.upto(pair.last) do |num|        
            digits = Array.new(10, 0)
            print = true
            saved_number = num
            unless memo[saved_number]
                while(num > 0) do
                    residual = num % 10;
                    digits[residual] += 1
                    if digits[residual] > 1
                        print = false
                        break
                    end
                    num /= 10
                end
            end
            if print
                memo[saved_number] = true    
                count += 1
            end
        end
        puts count    
    end  
end
