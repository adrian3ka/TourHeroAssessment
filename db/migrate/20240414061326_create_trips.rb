class CreateTrips < ActiveRecord::Migration[7.1]
  def change
    create_table :trips do |t|
      t.string :name
      t.string :description
      t.date :start_date
      t.date :end_date
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
