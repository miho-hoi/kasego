class Record < ApplicationRecord
  belongs_to :to_do
  belongs_to :user

  validates :date,  presence: true
  validates :times, presence: true

  validate :date_cannot_be_in_the_future
  
  private

  def date_cannot_be_in_the_future
    if date.present? && date > Date.today
      errors.add(:date, "は今日以前の日付を選択してください")
    end
  end
end
