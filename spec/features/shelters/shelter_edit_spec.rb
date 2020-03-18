require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
 describe "when I visit a shelters show page" do
  it "I click button to update shelter" do
    shelter1 = Shelter.create!(name: "Burt's Barn",
                               address: "123 Sesame Street",
                               city: "New York",
                               state: "NY",
                               zip: "12345")

     visit "/shelters/#{shelter1.id}" 
     
    expect(page).to have_content(shelter1.name)
    expect(page).to have_content(shelter1.address)
    expect(page).to have_content(shelter1.city)
    expect(page).to have_content(shelter1.state)
    expect(page).to have_content(shelter1.zip)

    click_button "Update Shelter"

    fill_in :city, with: "Minnetonka"
    fill_in :state, with: "MN"

    click_button "Update"

    expect(page).to have_content(shelter1.name)
    expect(page).to have_content(shelter1.address)
    expect(page).not_to have_content(shelter1.city)
    expect(page).to have_content("Minnetonka")
    expect(page).not_to have_content(shelter1.state)
    expect(page).to have_content("MN")
    expect(page).to have_content(shelter1.zip)
  end
 end
end