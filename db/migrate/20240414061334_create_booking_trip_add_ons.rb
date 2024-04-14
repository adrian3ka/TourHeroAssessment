class CreateBookingTripAddOns < ActiveRecord::Migration[7.1]
  def change
    create_table :booking_trip_add_ons do |t|
      t.references :booking_trip, null: false, foreign_key: true
      t.references :add_on, null: false, foreign_key: true

      t.timestamps
    end
    add_index :booking_trip_add_ons, [:booking_trip_id, :add_on_id], unique: true
  end
end
