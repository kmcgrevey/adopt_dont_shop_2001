class Pet < ApplicationRecord

  validates_presence_of :name,
                        :approx_age,
                        :sex
  belongs_to :shelter

end