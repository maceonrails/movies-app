class Country < ApplicationRecord
  has_many :locations

  validates :name, presence: true
end
