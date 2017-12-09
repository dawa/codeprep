    def permutation(lst)
      # If lst is empty then there are no permutations
      return [] if lst.empty?
 
      # If there is only one element in lst then, only
      # one permuatation is possible
      return [lst] if lst.size == 1
 
      # Find the permutations for lst if there are
      # more than 1 item
 
      l = [] # empty list that will store current permutation
 
      # Iterate the input(lst) and calculate the permutation
      0.upto(lst.size-1) do |i|
        m = lst[i]
 
        # Extract lst[i] or m from the list.  remLst is
        # remaining list
        remLst = lst[0..i-1] + lst[i+1..-1]
 
       # Generating all permutations where m is first element
       p = permutation(remLst)
       l.append([m] + p)
      end
      return l
    end

