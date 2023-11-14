class ToDo < ApplicationRecord
  has_many :records

  validates :content, presence: true, uniqueness: true
  validates :price, presence: true

  def content_price
    "#{content} - #{price}円"
  end
end
