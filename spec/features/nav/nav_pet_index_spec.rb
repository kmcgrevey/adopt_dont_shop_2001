require 'rails_helper'

RSpec.describe "When I visit any page on site", type: :feature do
  it "I click link at top to go to pet index" do
   shelter1 = Shelter.create!(name: "Burt's Barn",
                                 address: "123 Sesame Street",
                                 city: "New York",
                                 state: "NY",
                                 zip: "12345")
      
    pet1 = shelter1.pets.create!(image: "https://assets.change.org/photos/3/yk/di/kLYkdIaPKknZpoD-800x450-noPad.jpg?1519383791",
                                 name: "Penelope",
                                 approx_age: 1,
                                 sex: "female")
    # PETS 
    visit "/pets"

    click_on "Pet Index"
    expect(current_path).to eq("/pets")
    
    visit "/pets/#{pet1.id}"

    click_on "Pet Index"
    expect(current_path).to eq("/pets")
    
    visit "/pets/#{pet1.id}/edit"

    click_on "Pet Index"
    expect(current_path).to eq("/pets")

    #SHELTERS
    visit "/shelters"

    click_on "Pet Index"
    expect(current_path).to eq("/pets")
    
    visit "/shelters/new"

    click_on "Pet Index"
    expect(current_path).to eq("/pets")
    
    visit "/shelters/#{shelter1.id}"

    click_on "Pet Index"
    expect(current_path).to eq("/pets")
    
    visit "/shelters/#{shelter1.id}/edit"

    click_on "Pet Index"
    expect(current_path).to eq("/pets")
    
    #SHELTER_PETS
    visit "/shelters/#{shelter1.id}/pets"

    click_on "Pet Index"
    expect(current_path).to eq("/pets")
    
    visit "/shelters/#{shelter1.id}/pets/new"

    click_on "Pet Index"
    expect(current_path).to eq("/pets")
  end
end