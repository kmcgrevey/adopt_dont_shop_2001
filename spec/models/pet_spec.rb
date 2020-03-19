require 'rails_helper'

RSpec.describe Pet, type: :model do
  
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :approx_age}
    it {should validate_presence_of :sex}
  end

  describe "relationships" do
    it {should_belong_to :shelter}
  end

end