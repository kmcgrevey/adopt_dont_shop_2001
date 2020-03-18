require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  it "I click link on shelter index page to create new shelter" do
    visit '/shelters'

    expect(page).not_to have_content("Oscar's Orphans")

    click_button 'New Shelter'

    expect(current_path).to eq('/shelters/new')

    fill_in :name, with: "Oscar's Orphans"
    fill_in :address, with: "25 Mockingbird Lane"
    fill_in :city, with: "Carterville"
    fill_in :state, with: "IL"
    fill_in :zip, with: "62918"

    click_button 'Create Shelter'

    expect(current_path).to eq('/shelters')

    expect(page).to have_content("Oscar's Orphans")
  end

end