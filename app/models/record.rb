class Record < ApplicationRecord
  belongs_to :to_do

  validates :date,  presence: true
  validates :times, presence: true
end
