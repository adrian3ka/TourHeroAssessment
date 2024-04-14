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

  has_many :add_ons
  has_many :booking_trips
end
