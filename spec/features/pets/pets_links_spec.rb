require 'rails_helper'

RSpec.describe "When I click a pet name anywhere on site", type: :feature do
  it "I go to that pet show page" do
    shelter1 = Shelter.create!(name: "Burt's Barn",
                                 address: "123 Sesame Street",
                                 city: "New York",
                                 state: "NY",
                                 zip: "12345")
      
    pet1 = shelter1.pets.create!(image: "https://assets.change.org/photos/3/yk/di/kLYkdIaPKknZpoD-800x450-noPad.jpg?1519383791",
                                 name: "Penelope",
                                 description: "A face only everyone could love!",
                                 approx_age: 1,
                                 sex: "female")
    
    visit "/pets"

    click_on "#{pet1.name}"
    expect(current_path).to eq("/pets/#{pet1.id}")
    expect(page).to have_content(pet1.description)

    visit "/shelters/#{shelter1.id}/pets"
    click_on "#{pet1.name}"
    expect(current_path).to eq("/pets/#{pet1.id}")
    expect(page).to have_content(pet1.description)
  end
end