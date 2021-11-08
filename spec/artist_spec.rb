require './lib/photograph'
require './lib/artist'
RSpec.describe Artist do
  before :each do
    @attributes = {
  id: "2",
  name: "Ansel Adams",
  born: "1902",
  died: "1984",
  country: "United States"
  }
  @artist = Artist.new(@attributes)
  end

  it "exists" do

    expect(@artist).to be_an_instance_of(Artist)
    expect(@artist.id).to eq("2")
    expect(@artist.name).to eq("Ansel Adams")
    expect(@artist.born).to eq("1902")
    expect(@artist.died).to eq("1984")
    expect(@artist.country).to eq("United States")
  end

  it '#age_of_death' do

    expect(@artist.age_of_death).to eq(82)
  end
end
