class Solution
    # @param a : string
    # @param b : constant array of strings
    # @return an array of integers
    def findSubstring(a, b)
        result = []
        return result if a.nil? || b.empty?

        # frequency of words
        map = {}

        b.each do |w|
            if map[w]
                map[w] = map[w] + 1
            else
                map[w] = 1
            end
        end
 
        len = b[0].length
 
        0.upto(len) do |j|
            current_map = {}
            start = j  # start index of start
            count = 0  # count total qualified words so far
     
            i=j
            while i <= a.size-len do 
                sub = a[i, len]
                if map[sub]
                    # set frequency in current map
                    if current_map[sub]
                        current_map[sub] = current_map[sub] + 1
                    else
                        current_map[sub] = 1
                    end
     
                    count += 1
     
                    while current_map[sub] > map[sub] do
                        left = a[start, len]
                        current_map[left] = current_map[left] - 1
     
                        count -= 1
                        start = start + len
                    end
     
     
                    if count == b.length
                        result << start # add to result
     
                        # shift right and reset current_map, count & start point         
                        left = a[start, len]
                        current_map[left] = current_map[left] -1
                        count -= 1
                        start = start + len
                    end
                else
                    current_map.clear
                    start = i+len
                    count = 0
                end
                i = i+len
            end
        end
 
        return result.uniq    
    end
end

