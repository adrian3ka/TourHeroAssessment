class CreateBookingTrips < ActiveRecord::Migration[7.1]
  def change
    create_table :booking_trips do |t|
      t.references :user, null: false, foreign_key: true
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
    add_index :booking_trips, [:user_id, :trip_id], unique: true
  end
end
