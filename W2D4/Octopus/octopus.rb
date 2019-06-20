require "colorize"
class Octopus

    def find_longest_0(arr) #n^2
        sorted = false
        while !sorted
            sorted = true
            i = 0
            while i < arr.length - 1
                if arr[i].length > arr[i + 1].length
                    arr[i], arr[i + 1] = arr[i + 1], arr[i]
                    sorted = false
                end
                i += 1
            end
        end
        return arr.last
    end

    def find_longest_1(arr) #n^2
        arr.each {|el|
            biggest = true
            arr.each_with_index {|el2, i|
                biggest = false if el2.length > el.length
            }
            return el if biggest == true
        }
    end

    def find_longest_2(arr)
        merge_sort(arr).last
    end

    def merge_sort(arr)
        return arr if arr.size < 2
        mid = arr.length / 2
        left = merge_sort(arr.take(mid))
        right = merge_sort(arr.drop(mid))
        merge(left, right)
    end

    def merge(left, right)
        merged = []
        until left.empty? || right.empty?
            case left[0].length <=> right[0].length
            when -1
                merged << left.shift
            when 0
                merged << left.shift
            when 1
                merged << right.shift
            end
        end
        merged + left + right
    end


    def find_longest_3(arr)
        longest = ""
        arr.each {|el| longest = el if el.length > longest.length}
        longest
    end


end

ocean = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
octo = Octopus.new
system "clear"


puts "bubble sort        n^2"
start = Time.now
p octo.find_longest_0(ocean)
finish = Time.now

p diff = finish - start

puts "##############################".colorize(:blue)
puts "nested loops       n^2"
start = Time.now
p octo.find_longest_1(ocean)
finish = Time.now

p diff = finish - start

puts "##############################".colorize(:blue)
puts "merge sort        nlogn"
start = Time.now
p octo.find_longest_2(ocean)
finish = Time.now

p diff = finish - start

puts "##############################".colorize(:blue)
puts "smart              n"
start = Time.now
p octo.find_longest_3(ocean)
finish = Time.now

p diff = finish - start

puts "##############################".colorize(:blue)

#O(n^2)
#O(nlogn)
#O(n)

