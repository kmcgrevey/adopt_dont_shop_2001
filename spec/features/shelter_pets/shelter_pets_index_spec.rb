require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit shelter_pets index page" do
    it "I see each pets image and stats" do
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
      
      pet1 = shelter1.pets.create!(image: "https://assets.change.org/photos/3/yk/di/kLYkdIaPKknZpoD-800x450-noPad.jpg?1519383791",
                                   name: "Penelope",
                                   approx_age: 1,
                                   sex: "female")
      pet2 = shelter1.pets.create!(image: "https://external-preview.redd.it/P4X2K5llPbMkRkmFkycSPdDGAp051xJl0UF50bZRId4.jpg?auto=webp&s=5231b2f36d623b3258d36adbfbaf9be305f0d419",
                                   name: "Petey",
                                   approx_age: 1,
                                   sex: "male")
      pet3 = shelter2.pets.create!(image: "https://www.thesun.co.uk/wp-content/uploads/2019/10/NINTCHDBPICT000528091420.jpg?strip=all&w=960",
                                   name: "Francisco",
                                   approx_age: 3,
                                   sex: "male")
      
      visit "/shelters/#{shelter1.id}/pets"

      expect(page).to have_content(shelter1.name)

      within "#shelter-pet-#{pet1.id}" do
        expect(page).to have_css("img[src*='#{pet1.image}']")
        expect(page).to have_content(pet1.name)
        expect(page).to have_content(pet1.approx_age)
        expect(page).to have_content(pet1.sex)
      end
  
      within "#shelter-pet-#{pet2.id}" do
        expect(page).to have_css("img[src*='#{pet2.image}']")
        expect(page).to have_content(pet2.name)
        expect(page).to have_content(pet2.approx_age)
        expect(page).to have_content(pet2.sex)
      end
  
      expect(page).not_to have_css("img[src*='#{pet3.image}']")
      expect(page).not_to have_content(pet3.name)
      expect(page).not_to have_content(shelter2.name)
    end
  end
end