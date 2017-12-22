class Teacher < ApplicationRecord
  
  # Assossiations
  has_and_belongs_to_many :schools

  # Validations
  validates :name, :instruct, presence: true

  # Scopes
  scope :search, -> (term) { where("lower(name) LIKE ?", "%#{term.downcase}%")}
end
