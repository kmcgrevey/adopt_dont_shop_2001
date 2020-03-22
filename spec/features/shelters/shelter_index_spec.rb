require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit the shelters index page" do
    it "I see the name of each shelter" do
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
    end

    it "it has a button to create a new shelter" do
      visit "/shelters"
      
      expect(page).to have_button("New Shelter")
    end

    it "I can click link next to each shelter to edit" do
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

      within "#shelter-#{shelter1.id}" do
        click_link "Update Info"
      end
      expect(current_path).to eq("/shelters/#{shelter1.id}/edit")
      expect(page).to have_field(:name)
      
      visit "/shelters"                           
  
      within "#shelter-#{shelter2.id}" do
        click_link "Update Info"
      end
      expect(current_path).to eq("/shelters/#{shelter2.id}/edit")
      expect(page).to have_field(:name)
    end
   
    it "I can click link next to each shelter to delete it" do
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

      within "#shelter-#{shelter1.id}" do
        click_link "Delete"
      end
      
      expect(page).not_to have_content(shelter1.name)
      expect(page).to have_content(shelter2.name)
  
      within "#shelter-#{shelter2.id}" do
        click_link "Delete"
      end
      
      expect(page).not_to have_content(shelter1.name)
      expect(page).not_to have_content(shelter2.name)      
    end
  end
end
# As a visitor
# When I visit the shelter index page
# Next to every shelter, I see a link to delete that shelter
# When I click the link
# I am returned to the Shelter Index Page
#   where I no longer see that shelter