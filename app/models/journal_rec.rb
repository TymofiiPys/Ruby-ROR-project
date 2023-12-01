class JournalRec < ApplicationRecord
  validates :surname, presence: :true, length: { maximum: 64}
  validates :group, presence: :true, length: { maximum: 64}

  def average
    sum = 0
    sum += mark1.nil? ? 0 : mark1
    sum += mark2.nil? ? 0 : mark2
    sum += mark3.nil? ? 0 : mark3
    (sum / 3).round(2)
  end
end
