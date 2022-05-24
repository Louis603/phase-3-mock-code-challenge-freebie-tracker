class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item)
        received = self.freebies.where(item_name: item)
        if (received.length > 0)
            return true
        else 
            return false
        end
    end

    def give_away(dev, freebie)
        if (freebie.dev == dev)
            return "already has"
        else
            return freebie.update(dev: dev)
        end 
    end

end

# Dev#give_away(dev, freebie)
# accepts a Dev instance and a Freebie instance, changes the freebie's dev to be the given dev; your code should only make the change if the freebie belongs to the dev who's giving it away

# Dev#received_one?(item_name)
# accepts an item_name (string) and returns true if any of the freebies associated with the dev has that item_name, otherwise returns false