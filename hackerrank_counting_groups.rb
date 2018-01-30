# Complete the function below.

def countGroups(m, t)
    @row = m.size - 1
    @column = m.first.length - 1
    # puts "row:#{@row} column:#{@column}"
    visited = []
    # Make a bool array to mark visited cells.
    # Initially all cells are unvisited
    0.upto(@row) do |i|
        visited[i] = []
        0.upto(@column) do |j|
            visited[i][j] = false
        end
    end
    # puts "VISITED:#{visited.inspect}"
    # Initialize count as 0 and travese
    # through the all cells of
    # given matrix
    count = 0
    result = []
    0.upto(@row) do |i|
        0.upto(@column) do |j|
            # If a cell with value 1 is not visited yet,
            # then new island found
            # puts "checking[#{i}][#{j}]"
            if visited[i][j] == false && m[i][j] == 1
                # Visit all cells in this island
                # and increment island count
                group = dfs(i, j, visited, m, 0)
                count += 1
                result[group] = result[group].to_i + 1
                #puts "looping i:#{i}, j:#{j} count:#{count} group:#{group} result:#{result.inspect}"
            end
        end
    end
    output = []
    t.each do |num|
        output << result[num].to_i
    end
    return output
end

# A function to check if a given cell
# (row, col) can be included in DFS
def isSafe(i, j, visited, m)
    # row number is in range, column number
    # is in range and value is 1
    # and not yet visited
    # puts "isSafe i:#{i}, j:#{j} visited:#{visited.inspect}"
    return  i >= 0 && i <= @row &&
    j >= 0 && j <= @column &&
    !visited[i][j] && m[i][j] == 1
end

# A utility function to do DFS for a 2D
# boolean matrix. It only considers
# the 4 neighbours as adjacent vertices
def dfs(i, j, visited, m, group)
    # These arrays are used to get row and
    # column numbers of 4 neighbours
    # of a given cell
    rowNbr = [-1,  0, 0,  1]
    colNbr = [ 0, -1, 1,  0]

    # Mark this cell as visited
    visited[i][j] = true
    group += 1
    #puts "dfs #{i}, #{j} group:#{group}"
    # Recurse for all connected neighbours
    0.upto(4 - 1) do |k|
        if isSafe(i + rowNbr[k], j + colNbr[k], visited, m)
            # puts "k:#{k} i:#{i + rowNbr[k]}, j:#{j + colNbr[k]}"
            group = dfs(i + rowNbr[k], j + colNbr[k], visited, m, group)
        end
    end
    #puts "RETURN:#{group}"
    return group
end


