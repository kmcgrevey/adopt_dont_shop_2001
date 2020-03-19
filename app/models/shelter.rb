class Shelter < ApplicationRecord
  validates_presence_of :name, 
                        :address,
                        :city,
                        :state,
                        :zip
  # validates_numericality_of :zip, greater_than: 0
  
  has_many :pets
end