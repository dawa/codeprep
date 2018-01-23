def pascalTriangle(k)
    result = []
    pascalTriangleR(k, 0, result)
    result.each do |row|
        puts row.join(' ')
    end
end

def pascalTriangleR(k, n, result)
    if n == k
        return
    end
    
    temp = []
    0.upto(n) do |r|
       temp << n.fact/(r.fact*(n-r).fact)
    end
    result << temp
    pascalTriangleR(k, n+1, result)
end

class Integer
  def fact
    (1..self).reduce(:*) || 1
  end
end
