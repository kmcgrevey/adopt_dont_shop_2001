require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit a pet show page" do
    it "I see a link to and will delete that pet" do
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
      pet2 = shelter1.pets.create!(image: "https://external-preview.redd.it/P4X2K5llPbMkRkmFkycSPdDGAp051xJl0UF50bZRId4.jpg?auto=webp&s=5231b2f36d623b3258d36adbfbaf9be305f0d419",
                             name: "Petey",
                             description: "Rubber baby bacon booties!",
                             approx_age: 1,
                             sex: "male")

      visit "/pets"

      expect(page).to have_content(pet1.name)
      expect(page).to have_content(pet2.name)

      visit "/pets/#{pet1.id}"

      click_link "Delete Pet"

      expect(current_path).to eq("/pets")
      expect(page).not_to have_content(pet1.name)
      expect(page).to have_content(pet2.name)
    end
  end
end





# Then a 'DELETE' request is sent to '/pets/:id',
# the pet is deleted,
# and I am redirected to the pet index 
# page where I no longer see this pet