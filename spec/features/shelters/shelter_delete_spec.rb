require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit the shelters show page" do
    it "I see a button to delete that shelter" do
      shelter1 = Shelter.create!(name: "Burt's Barn",
                                 address: "123 Sesame Street",
                                 city: "New York",
                                 state: "NY",
                                 zip: "12345")
      shelter2 = Shelter.create!(name: "Ernie's Everhome",
                                 address: "505 Elmwood Drive",
                                 city: "Chelsea",
                                 state: "MA",
                                 zip: "02468")

      visit "/shelters"

      expect(page).to have_content(shelter1.name)
      expect(page).to have_content(shelter2.name)

      visit "/shelters/#{shelter1.id}"

      click_button 'Delete Shelter'

      visit "/shelters"
      
      expect(page).not_to have_content(shelter1.name)
      expect(page).to have_content(shelter2.name)
    end
    
    it "button will delete shelter that has pets" do
      shelter1 = Shelter.create!(name: "Burt's Barn",
                                 address: "123 Sesame Street",
                                 city: "New York",
                                 state: "NY",
                                 zip: "12345")
      pet1 = shelter1.pets.create!(image: "https://assets.change.org/photos/3/yk/di/kLYkdIaPKknZpoD-800x450-noPad.jpg?1519383791",
                                   name: "Penelope",
                                   approx_age: 1,
                                   sex: "female")
      pet2 = shelter1.pets.create!(image: "https://external-preview.redd.it/P4X2K5llPbMkRkmFkycSPdDGAp051xJl0UF50bZRId4.jpg?auto=webp&s=5231b2f36d623b3258d36adbfbaf9be305f0d419",
                                   name: "Petey",
                                   approx_age: 1,
                                   sex: "male")

      visit "/shelters"
      
      expect(page).to have_content(shelter1.name)
      
      visit "/pets"
      
      expect(page).to have_content(pet1.name)
      expect(page).to have_content(pet2.name)
      
      visit "/shelters/#{shelter1.id}"

      click_button 'Delete Shelter'

      visit "/shelters"
      
      expect(page).not_to have_content(shelter1.name)

      visit "/pets"
      
      expect(page).not_to have_content(pet1.name)
      expect(page).not_to have_content(pet2.name)
    end
  end
end