class Queue
    def initialize
        @items = []
    end

    def enqueue(el)
        items.push(el)
       
    end

    def dequeue
        items.shift
    end

    def peek
        items[0]
    end
    private
    attr_accessor :items
end
