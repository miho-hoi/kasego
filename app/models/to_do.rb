class ToDo < ApplicationRecord
  has_many :records

  validates :content, presence: true, uniqueness: true
  validates :price, presence: true
end
