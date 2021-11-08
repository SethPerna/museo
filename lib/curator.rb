class Curator
  attr_reader :photographs, :artists
  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(photo)
    @photographs.push(photo)
  end

  def add_artist(artist)
    @artists.push(artist)
  end

  def find_artist_by_id(id)
    found_artist = @artists.select do |artist|
      artist.id == id
    end
    found_artist[0]
  end

  def photographs_by_artist
    artist_hash = {}
    @artists.map do |artist|
      artist_hash[artist] = @photographs.select { |photo| photo.artist_id == artist.id}
    end
    artist_hash
  end

  def artists_with_multiple_photographs
    number_of_paintings = @photographs.group_by do |photo|
      photo.artist_id
    end
    it_works = [find_artist_by_id(number_of_paintings.max[0]).name]
  end

  def photographs_taken_by_artist_from(location)
    country_men = artists.select { |artist| artist.country == location}
    country_men.map do |artist|
      @photographs.select do |photo|
        photo.artist_id == artist.id
      end
    end.flatten
  end
end
