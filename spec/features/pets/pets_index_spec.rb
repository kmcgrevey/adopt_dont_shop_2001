require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit pets index page" do
    it "I see each pet its image and stats" do
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
      
      visit "/pets"

      within "#pet-#{pet1.id}" do
        expect(page).to have_css("img[src*='#{pet1.image}']")
        expect(page).to have_content(pet1.name)
        expect(page).to have_content(pet1.approx_age)
        expect(page).to have_content(pet1.sex)
        expect(page).to have_content(shelter1.name)
      end
  
      within "#pet-#{pet2.id}" do
        expect(page).to have_css("img[src*='#{pet2.image}']")
        expect(page).to have_content(pet2.name)
        expect(page).to have_content(pet2.approx_age)
        expect(page).to have_content(pet2.sex)
        expect(page).to have_content(shelter1.name)
      end
  
      within "#pet-#{pet3.id}" do
        expect(page).to have_css("img[src*='#{pet3.image}']")
        expect(page).to have_content(pet3.name)
        expect(page).to have_content(pet3.approx_age)
        expect(page).to have_content(pet3.sex)
        expect(page).to have_content(shelter2.name)
      end
    end

    it "I can click link next to each pet to edit it" do
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
    
      visit "/pets"

      within "#pet-#{pet1.id}" do
        click_link "Update Pet"
      end
      
      expect(current_path).to eq("/pets/#{pet1.id}/edit")
      expect(page).to have_field(:name)
      expect(page).to have_field(:approx_age)
      
      visit "/pets"

      within "#pet-#{pet2.id}" do
        click_link "Update Pet"
      end
      
      expect(current_path).to eq("/pets/#{pet2.id}/edit")
      expect(page).to have_field(:name)
      expect(page).to have_field(:approx_age)
    end
    
    it "I can click link next to each pet to delete it" do
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
    
      visit "/pets"

      expect(page).to have_content(pet1.name)
      expect(page).to have_content(pet2.name)
      
      within "#pet-#{pet1.id}" do
        click_link "Delete Pet"
      end
      
      expect(page).not_to have_content(pet1.name)
      expect(page).to have_content(pet2.name)
    

      within "#pet-#{pet2.id}" do
        click_link "Delete Pet"
      end
  
    end
  end
end