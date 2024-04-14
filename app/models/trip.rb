class Trip < ApplicationRecord
  attribute :name, :string
  attribute :description, :string
  attribute :start_date, :date
  attribute :end_date, :date
  attribute :price, :decimal

  validates :name, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :price, presence: true

  validate :end_date_after_start_date

  def booked_by_user?(user)
    booking_trips.exists?(user_id: user.id)
  end

  has_many :add_ons
  has_many :booking_trips

  def end_date_after_start_date
    if start_date && end_date && end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
