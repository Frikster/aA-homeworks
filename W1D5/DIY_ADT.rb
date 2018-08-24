class Stack
  def initialize(arr)
    @stack = arr
  end

  def push(el)
    @stack.push(el)
  end

  def pop
    @stack.pop(el)
  end

  def peek
    @stack[-1]
  end
end

class Queue
  def initialize(arr)
    @queue = arr
  end

  def enqueue(el)
    @queue.push(el)
  end

  def dequeue
    @queue.shift
  end

  def peek
    @queue[0]
  end

end

class Map
  def initialize(k_v_arr)
    @my_map = k_v_arr
  end

  def set(key, value)
    if get(key)
      @my_map.each_with_index do |pair, idx|
        @my_map[idx][1] = value if pair[0] == key
      end
    else
      @my_map.push([key, value])
    end
  end

  def get(key)
    pairs = @my_map.select{ |k, v| k == key }
    return nil if pairs.length == 0
    pairs[0][1]
  end

  def delete(key)
    val = get(key)
    @my_map -= [[key, val]]
  end

  def show
    @my_map.each do |k, v|
      puts(k.to_s + ' => ' + v.to_s)
    end
  end
end
