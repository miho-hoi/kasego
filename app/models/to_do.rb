class ToDo < ApplicationRecord
  has_many :records

  validates :content, presence: true, uniqueness: { case_sensitive: true }
  validates :price, presence: true
end
