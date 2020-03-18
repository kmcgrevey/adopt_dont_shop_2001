require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "When I visit a shelters show page" do
    it "I can see that shelter and its info" do
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

      visit "/shelter/#{shelter1.id}"

      expect(page).to have_content(shelter1.name)
      expect(page).to have_content(shelter1.address)
      expect(page).to have_content(shelter1.city)
      expect(page).to have_content(shelter1.state)
      expect(page).to have_content(shelter1.zip)

      expect(page).not_to have_content(shelter2.name)

    end
  
  
  
  end

end