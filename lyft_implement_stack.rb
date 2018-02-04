# Max Stack:
# push(i):    Add i to the top of the stack
# pop():      Remove and return the value on the top of the stack
# peek():     Return, but do not remove, the value on the top of the stack
# max():      Return, but do not remove, the maximum of all values currently in the stack
# 
# stack.push(3)
# # stack contents = [3]
# stack.peek() == 3
# stack.max() == 3
# 
# stack.push(1)
# # stack contents = [3, 1]
# stack.peek() == 1
# stack.max() == 3
# 
# stack.push(4)
# # stack contents = [3, 1, 4]
# stack.peek() == 4
# stack.max() == 4
# 
# stack.pop() == 4
# # stack contents = [3, 1]
# stack.peek() == 1
# stack.max() == 3

# stack = [3, 1]
# max = 4
# max_hash = { 3 => [0], 1 => [1], 4 => nil}

#
class Stack
  def initialize()
    @stack = []
    @max = 0
    @max_hash = {}
  end
  
  def push(num)
    @stack << num
    @max = [@max, num].max
    index_num =[@stack.size - 1]
    
    if @max_hash[num].nil?
      @max_hash[num] = [1]
    else
      @max_hash[num] << @max_hash[num] + 1
    end
  end
  
  def pop()
    num = @stack.pop
    if num == max
      #puts "MAX:#{@max_hash.inspect}"
      if @max_hash[num].size == 1
        @max_hash.delete(num)
        @max = @max_hash.keys.sort.last
        #puts "keys:#{@max_hash.keys.sort.last} max:#{max}"
        
      else
        @max_hash[num] = @max_hash[num] - 1
      end
    end
    return num
  end
  
  def peek()
    return @stack.last
  end
  
  def max()
    return @max
  end
end

my_stack = Stack.new()

my_stack.push(3)
# stack contents = [3]
puts my_stack.peek()
puts my_stack.max()

my_stack.push(1)
# # stack contents = [3, 1]
puts my_stack.peek()
puts my_stack.max()
# 
my_stack.push(4)
# # stack contents = [3, 1, 4]
puts my_stack.peek()
puts my_stack.max()
# 
my_stack.pop()
# # stack contents = [3, 1]
puts my_stack.peek()
puts my_stack.max()

my_stack.pop()
# # stack contents = [3, 1]
puts my_stack.peek()
puts my_stack.max()
