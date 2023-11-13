class Record < ApplicationRecord
  belongs_to :to_do

  validates :date
  validates :times
end
