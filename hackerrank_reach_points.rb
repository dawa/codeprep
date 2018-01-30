# Complete the function below.

def canReach(x1, y1, x2, y2)
   #puts "x1:#{x1} y1:#{y1} x2:#{x2} y2:#{y2}" 
   if x1 > x2 || y1 > y2
       return "No"
   end    
   if x1 == x2 && y1 == y2
       return "Yes"
   end    
   return (canReach(x1 + y1, y1, x2, y2) == "Yes" || canReach(x1, x1 + y1, x2, y2) == "Yes") ? "Yes" : "No"
end


