class Museum < ActiveRecord::Base
    has_many :paintings
    has_many :artists, through: :paintings

    def combined_value
        # self.paintings.sum{|p| p.price_in_us_dollars}
        self.paintings.sum(:price_in_us_dollars)
        # self.paintings.calculate(:sum, :price_in_us_dollars)
    end

    def average_price
        # self.paintings.calculate(average, :price_in_us_dollars)
        self.combined_value / self.paintings.length
    end



    def self.fanciest
        # self.all.calculate(:maximum, :price_in_us_dollars)
        self.all.max_by {|m| m.average_price}
    end

    def exhibit_artist(artist)
        artist.paintings.update(museum_id: self.id)
    end

end
