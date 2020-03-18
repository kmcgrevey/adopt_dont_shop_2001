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


  end

end