class Pet < ApplicationRecord

  validates_presence_of :name,
                        :approx_age,
                        :sex
  belongs_to :shelter

  def adopt_status
    if status == 0
      'adoptable'
    elsif status == 1
      'pending'
    else
      'unknown'
    end
  end

end