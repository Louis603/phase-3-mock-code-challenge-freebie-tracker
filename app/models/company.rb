class Company < ActiveRecord::Base
has_many :freebies
has_many :devs, through: :freebies

    def give_freebie(dev, item_name, value)
        developer = self.devs.find_or_create_by(name: dev)

        Freebie.create(item_name: item_name, value: value, dev_id: developer.id, company_id: self.id)
    end

    def self.oldest_company
        self.order(:founding_year).first
    end

end


# Company#give_freebie(dev, item_name, value)
# "company.first thiscomapny is the self or instance"
# takes a dev (an instance of the Dev class), an item_name (string), and a value as arguments, and creates a new Freebie instance associated with this company and the given dev

# chalk = Freebie.create(item, value, dev: argument)