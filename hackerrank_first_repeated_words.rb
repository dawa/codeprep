def firstRepeatedWord(s)
   words = s.gsub(/\\t,:;-\./, ' ').split(' ')
   memo = {} 
   words.each do |w|
      return w if memo[w]
      memo[w] = true 
   end
end


