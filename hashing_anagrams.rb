class Solution
    # @param a : constant array of strings
    # @return an array of array of integers
    def anagrams(a)
       output = []
       return output if a.empty?
       sorted = {}
       a.each_with_index do |word, index|
           key = word.chars.sort.join('')
           if sorted[key].nil?
               sorted[key] = [index+1]
           else
               sorted[key] = sorted[key] << index+1
           end
       end
       #puts sorted.inspect
       sorted.each do |key, list| 
           output << list
       end
       output
    end
end

