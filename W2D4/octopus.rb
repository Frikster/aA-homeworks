def sluggish_octopus(arr)
  arr.each do |fish1|
    arr.each do |fish2|
      if fish1.length <= fish2.length
        longest = fish2
      end
    end
  longest
end

def dominant_octopus(arr)
  arr = arr.sort_by{|fish| fish.length}
  arr[-1]
end

def clever_octopus(arr)
  longest = arr[0]
  arr.each do |fish|
    if fish.length > longest.length
      longest = fish
    end
  end
  longest
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
def slow_dance(dir, tiles_array)
  tiles_array.index(dir)
end

tiles_hash = {}
tiles_array.each{ |el| tiles_hash[el] = el }
def constant_dance(arr, tiles_hash)
  tiles_hash[dir]
end
