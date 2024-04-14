class BookingTrip < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  has_many :booking_trip_add_ons
  has_many :add_ons, through: :booking_trip_add_ons

  validate :add_ons_do_not_overlap

  def total_amount
    trip_price = trip.price || 0
    add_ons_price = booking_trip_add_ons.sum { |bta| bta.add_on.price || 0 }

    trip_price + add_ons_price
  end

  private

  def add_ons_do_not_overlap
    selected_add_ons = AddOn.where(id: add_on_ids)
    selected_add_ons.each_with_index do |add_on, index|
      next unless add_on.start_time && add_on.end_time

      conflicting_add_ons = selected_add_ons[index + 1..-1].select do |other_add_on|
        other_add_on.start_time && other_add_on.end_time &&
          (add_on.start_time..add_on.end_time).overlaps?(other_add_on.start_time..other_add_on.end_time)
      end

      conflicting_add_ons.each do |conflicting_add_on|
        errors.add(:base, "Add-ons #{add_on.name} and #{conflicting_add_on.name} have conflicting times")
      end
    end
  end
end
