require "byebug"
class DancingOctopus
    
    def slow_dance(target, arr)
        arr.index(target)
    end

    def fast_dance(target, arr)
        # debugger
        if target == "down"
            hash_res = 1
        else 
            hash_res = target.length
        end
        arr[hash_res]
    end
end
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
#2 8 5 10 4 9 4 7
# new_tiles_data_structure = ["down", nil, "up", nil, "left", "right", nil, "left-up", "right-up", "left-down", "right-down"]
new_tiles_data_structure = [nil, 4, 0, nil, 6, 2, nil, 7, 1, 5, 3]
o = DancingOctopus.new
system "clear"
puts "slow-dance"
start = Time.now
p o.slow_dance("left-up", tiles_array)
finish = Time.now
puts diff = finish - start
puts "#####################################################"
puts "fast-dance"
start = Time.now
p o.fast_dance("left-up", new_tiles_data_structure)
finish = Time.now
puts diff = finish - start
