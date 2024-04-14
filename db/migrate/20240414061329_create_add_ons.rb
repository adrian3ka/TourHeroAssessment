class CreateAddOns < ActiveRecord::Migration[7.1]
  def change
    create_table :add_ons do |t|
      t.string :name
      t.string :description
      t.time :start_time
      t.time :end_time
      t.integer :spot_limit
      t.decimal :price, precision: 10, scale: 2
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
