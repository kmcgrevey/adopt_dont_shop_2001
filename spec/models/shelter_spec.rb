require 'rails_helper'

RSpec.describe Shelter, type: :model do
  
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :address}
    it {should validate_presence_of :city}
    it {should validate_presence_of :state}
    it {should validate_presence_of :zip}
  end

  describe "relationships" do
    it {should have_many :pets}
  end

  describe 'instance methods' do
    it ".pet_count" do
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
                                   description: "More than a fair weather companion!",
                                   approx_age: 1,
                                   sex: "male",
                                   status: 1)
      pet3 = shelter1.pets.create!(image: "https://www.thesun.co.uk/wp-content/uploads/2019/10/NINTCHDBPICT000528091420.jpg?strip=all&w=960",
                                   name: "Francisco",
                                   approx_age: 3,
                                   sex: "male",
                                   status: 1)

      expect(shelter1.pet_count).to eq(3)
    end
  end

end