class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :fromdate, :todate, presence: true
  before_validation :booking_date_cannot_be_in_the_past

  def booking_date_cannot_be_in_the_past
    if fromdate.present? && fromdate < Date.today
      errors.add(:fromdate, "Booking can't be in the past")
    elsif todate.present? && todate < Date.today
      errors.add(:todate, "Booking can't end in the past")
    elsif todate < fromdate
      errors.add(:todate, "must be after the from date")
    end
  end
end
