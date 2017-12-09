
class CustomHash
  def initialize()
    @length = 16
    @hash_array = []
    @size = 0
  end
  
  def get(key)
    index = hash_func(key)
    @hash_array[index][1] unless @hash_array[index].nil?
  end
    
  def put(key, value)
    index = hash_func(key)
    @hash_array[index] = [key, value]
    @size += 1
    @length += 16 if @size > @length 
  end
  
  def remove(key)
    index = hash_func(key)
    @hash_array.delete_at(index)
    @size -= 1
    #@length = @length/2 if @size < @length/2 
  end
  
  def size
    @size
  end
  
  def clear
    @hash_array = []
    @size = 0
  end
  
  def isEmpty?
    @size == 0
  end
  
  def containsKey?(key)
    @hash_array.each do |item|
      next if item.nil?
      return true if item.first == key
    end
    false
  end
  
  # [[5,"orange"], [], [], [25, "pear"], [] []]
  
  def containsValue?(value)
    puts @hash_array.inspect
    @hash_array.each do |item|
      next if item.nil?
      puts item
      return true if item[1] == value
    end
    false
  end
  
  private
  
  def hash_func(key)
    key % @length
  end
end


my_hash = CustomHash.new
puts my_hash.size
my_hash.put(5, "apple")

puts my_hash.get(5)
my_hash.put(5, "orange")

puts my_hash.get(5)
my_hash.put(25, "pear")

puts my_hash.get(25)

puts my_hash.size
my_hash.remove(5)

puts my_hash.get(5)

puts my_hash.size

#my_hash.clear


puts my_hash.isEmpty?


#puts my_hash.size

puts my_hash.containsKey?(25)

puts my_hash.containsKey?(12)

puts my_hash.containsValue?("orange")

puts my_hash.containsValue?("people")

