class School < ApplicationRecord
  has_one :address
  has_many :students
  has_and_belongs_to_many :teachers
end
