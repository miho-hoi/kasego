class Record < ApplicationRecord
  belongs_to :to_do
  belongs_to :user

  validates :date,  presence: true
  validates :times, presence: true
  
end