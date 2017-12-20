class School < ApplicationRecord
  belongs_to :address, dependent: :destroy
  has_many :students
  has_and_belongs_to_many :teachers
end
