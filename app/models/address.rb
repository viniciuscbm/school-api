class Address < ApplicationRecord
  
  # Assossiations
  belongs_to :school, optional: true

  # Validations
  validates :street, :neighborhood, :city, presence: true
end
