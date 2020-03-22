require 'rails_helper'

RSpec.describe "When I click a shelter name anywhere on site", type: :feature do
  it "I go to that shelters show page" do
    shelter1 = Shelter.create!(name: "Burt's Barn",
                                 address: "123 Sesame Street",
                                 city: "New York",
                                 state: "NY",
                                 zip: "12345")
      
    pet1 = shelter1.pets.create!(image: "https://assets.change.org/photos/3/yk/di/kLYkdIaPKknZpoD-800x450-noPad.jpg?1519383791",
                                 name: "Penelope",
                                 approx_age: 1,
                                 sex: "female")
    
    visit "/shelters"

    click_on "#{shelter1.name}"
    expect(current_path).to eq("/shelters/#{shelter1.id}")
    expect(page).to have_content(shelter1.address)

    visit "/pets"
    click_on "#{shelter1.name}"
    expect(current_path).to eq("/shelters/#{shelter1.id}")
    expect(page).to have_content(shelter1.address)
  end
end