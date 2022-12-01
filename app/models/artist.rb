class Artist < ActiveRecord::Base
    has_many :paintings
    has_many :museums, through: :paintings

    #Artist.all[4] => Rembrandt

    def full_name
        "#{self.last_name}, #{self.first_name}"
    end

    def self.sort_by_year
        self.all.sort_by{|artist| artist.birthyear }
    end

    def add_painting(museum, title, price_in_us_dollars)
        Painting.create(title: title, price_in_us_dollars: price_in_us_dollars, museum_id: museum.id, artist_id: self.id)
    end

end

# Artist.last.museums
# Artist.last.paintings.last.museum