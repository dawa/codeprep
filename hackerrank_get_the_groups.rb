def getTheGroups(n, queryType, students1, students2)
   if n == 0 || queryType.length == 0 || students1.length == 0 || students2.length == 0
       return [0]
   end
    
   friends_list = {}
   0.upto(n) do |i|
       friends_list[i] = []
   end
   result = []
   # For each query update the friends hash or get the sum
   # puts "queryType:#{queryType.inspect} students1:#{students1.inspect} students2:#{students2.inspect}"
   queryType.each_with_index do |query, i|
       if query == "Friend"
           friends_list[students1[i]] = friends_list[students1[i]] << students2[i] unless friends_list[students1[i]].include? students2[i]
           friends_list[students2[i]] = friends_list[students2[i]] << students1[i] unless friends_list[students2[i]].include? students1[i]
       elsif query == "Total"
           visited = []
           # puts "Friends list:#{friends_list.inspect}"
           count = dfs(students1[i], visited, friends_list, 0)
           result << dfs(students2[i], visited, friends_list, count)  
       end
   end
   result 
end

def dfs(i, visited, friends_list, count)
    return 0 if visited.include? i
    visited << i
    count += 1
    # puts "dfs #{i}, visited:#{visited.inspect} count:#{count}"
    # Recurse for all connected neighbours
    friends_list[i].uniq.each do |friend|
        count = dfs(friend, visited, friends_list, count) unless visited.include? friend
    end
    return count
end
