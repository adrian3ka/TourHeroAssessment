class AddOn < ApplicationRecord
  attribute :name, :string
  attribute :description, :string
  attribute :start_time, :time
  attribute :end_time, :time
  attribute :spot_limit, :integer
  attribute :price, :decimal

  validates :name, presence: true
  validates :description, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :price, presence: true

  def bookable?
    spot_limit.nil? || spot_limit > booking_trip_add_ons.count
  end

  belongs_to :trip
  has_many :booking_trip_add_ons
  has_many :booking_trips, through: :booking_trip_add_ons
end
