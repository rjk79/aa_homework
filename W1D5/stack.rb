class Stack
    def initialize
      # create ivar to store stack here!
      @items = []
    end

    

    def push(el)
      # adds an element to the stack
      items.push(el)
    end

    def pop
      items.pop
      # removes one element from the stack
    end

    def peek
      items[-1]
      # returns, but doesn't remove, the top element in the stack
    end
    private
    attr_accessor :items

  end

  if __FILE__ == $PROGRAM_NAME
    stack = Stack.new
    stack.push(3)
    p stack.items
    stack.push(3)
    p stack.items
    stack.push(4)
    p stack.items

    stack.pop
    p stack.items
    p stack.peek
  end