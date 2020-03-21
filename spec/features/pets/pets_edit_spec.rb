require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit a pet show page" do
    it "I can click link to update that pet"do
      shelter1 = Shelter.create!(name: "Burt's Barn",
                                address: "123 Sesame Street",
                                city: "New York",
                                state: "NY",
                                zip: "12345")
      pet2 = shelter1.pets.create!(image: "https://external-preview.redd.it/P4X2K5llPbMkRkmFkycSPdDGAp051xJl0UF50bZRId4.jpg?auto=webp&s=5231b2f36d623b3258d36adbfbaf9be305f0d419",
                                   name: "Petey",
                                   description: "Rubber baby bacon booties!",
                                   approx_age: 1,
                                   sex: "male")

      visit "/pets/#{pet2.id}"

      expect(page).to have_content("Petey")
      expect(page).to have_content(1)

      click_link "Update Pet"

      expect(current_path).to eq("/pets/#{pet2.id}/edit")
      fill_in :name, with: "Piglet"
      fill_in :approx_age, with: 27

      click_button "Update Pet"
      
      expect(current_path).to eq("/pets/#{pet2.id}")
      expect(page).to have_content("Piglet")
      expect(page).to have_content(27)
      expect(page).not_to have_content("Petey")
      expect(page).not_to have_content(1)
    end
  end
end