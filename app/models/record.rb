class Record < ApplicationRecord
  belongs_to :to_do
  belongs_to :user

  validates :date,  presence: true
  validates :times, presence: true

  # validate :date_should_be_today

  private

  def date_should_be_today
    errors.add(:date, "は当日以外は登録できません") unless date == Date.today
  end
end