n = gets.to_i
(0...n).each do |i|
    s = gets.strip
    len = s.size
    if len % 2 != 0
        puts -1
    else    
        mid = len/2
        a = s[0..mid-1]
        b = s[mid..-1]
        common = 0
        b.each_char do |char|
            index = a.index char
            if index
                a[index] = ''
            else
                common += 1 
            end
        end
        puts common
    end
end
