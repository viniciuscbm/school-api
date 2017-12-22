class Student < ApplicationRecord
  
  # Assossiations
  belongs_to :school, optional: true

  # Validations
  validates :name, :cpf, presence: true
  validates :cpf, length: { in: 11..14 }
	validates :cpf, numericality: true
	validates :cpf, uniqueness: true

  # Scopes
  scope :search, -> (term) { where("lower(name) LIKE ?", "%#{term.downcase}%")}
end
