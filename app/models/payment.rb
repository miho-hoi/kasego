class Payment < ApplicationRecord
  belongs_to :user

  validates :date,        presence: true
  validates :total_price, presence: true 
end
