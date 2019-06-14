class Map
    attr_accessor :items
    def initialize
        @items = []
    end

    def set(key, value)
        
        keys = items.map {|el| el[0]} #[1, 3, 4]

        if items.empty? || !keys.include?(key)
            items << [key, value]
        else
            idx = keys.index(key)
            items[idx][1] = value
        end
    end

    def get(key)
        keys = items.map {|el| el[0]} #[1, 3, 4]
        idx = keys.index(key)
        items[idx][1]
    end

    def delete(key)
        keys = items.map {|el| el[0]} #[1, 3, 4]
        idx = keys.index(key)
        items.delete_at[idx]
    end

    def show
        puts self.items.to_s
    end


end

