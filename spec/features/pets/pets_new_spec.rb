require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe"When I visit Shelter Pets Index page" do
    it "I can click link to create a new pet" do
      shelter1 = Shelter.create!(name: "Burt's Barn",
                                 address: "123 Sesame Street",
                                 city: "New York",
                                 state: "NY",
                                 zip: "12345")

      visit "/shelters/#{shelter1.id}/pets"

      expect(page).not_to have_content("Penelope")

      click_link "Create Pet"

      expect(current_path).to eq("/shelters/#{shelter1.id}/pets/new")

      fill_in :image, with: "https://assets.change.org/photos/3/yk/di/kLYkdIaPKknZpoD-800x450-noPad.jpg?1519383791"
      fill_in :name, with: "Penelope"
      fill_in :description, with: "A face only everyone could love!"
      fill_in :approx_age, with: 1
      choose(option: 'female')

      click_button "Create Pet"

      pet = Pet.last

      within "#shelter-pet-#{pet.id}" do
        expect(page).to have_css("img[src*='#{pet.image}']")
        expect(page).to have_content("Penelope")
        expect(page).to have_content(pet.approx_age)
        expect(page).to have_content(pet.sex)
        expect(page).to have_content("adoptable")
      end
    end
  end
end


