require 'rails_helper'

#ADOPTION STATUS: 0-adoptable, 1-pending

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit a pets show page" do
    it "I see that pet and its stats" do
      shelter1 = Shelter.create!(name: "Burt's Barn",
                                 address: "123 Sesame Street",
                                 city: "New York",
                                 state: "NY",
                                 zip: "12345")
      pet1 = shelter1.pets.create!(image: "https://assets.change.org/photos/3/yk/di/kLYkdIaPKknZpoD-800x450-noPad.jpg?1519383791",
                                   name: "Penelope",
                                   description: "A face only everyone could love!",
                                   approx_age: 1,
                                   sex: "female",
                                   status: 0)
      pet2 = shelter1.pets.create!(image: "https://external-preview.redd.it/P4X2K5llPbMkRkmFkycSPdDGAp051xJl0UF50bZRId4.jpg?auto=webp&s=5231b2f36d623b3258d36adbfbaf9be305f0d419",
                                   name: "Petey",
                                   approx_age: 1,
                                   sex: "male")  
      visit "/pets/#{pet1.id}" 
      
      expect(page).to have_css("img[src*='#{pet1.image}']")
      expect(page).to have_content(pet1.name)
      expect(page).to have_content(pet1.description)
      expect(page).to have_content(pet1.approx_age)
      expect(page).to have_content(pet1.sex)
      expect(page).to have_content("adoptable")
                    
      expect(page).not_to have_content(pet2.name)
    end
  end
end