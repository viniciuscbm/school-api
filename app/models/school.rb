class School < ApplicationRecord

  # Assossiations
  has_one :address, dependent: :destroy
  has_many :students, dependent: :destroy
  has_and_belongs_to_many :teachers

  accepts_nested_attributes_for :address, :students, update_only: true, allow_destroy: true

  # Validations
  validates :name, :cnpj, presence: true
  validates :cnpj, length: { in: 14..18 }
	validates :cnpj, numericality: true
  validates :cnpj, uniqueness: true
  
  # Scopes
  scope :search, -> (term) { where("lower(name) LIKE ?", "%#{term.downcase}%")}
  
  # Methods
  def as_json(options={})
    super(
      root: true,
      include: [:address, :students, :teachers]
    )
  end
end