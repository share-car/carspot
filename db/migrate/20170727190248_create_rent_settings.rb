class CreateRentSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :rent_settings do |t|
      t.integer :base_price, default: 0, null: false
      t.integer :driver_price
      t.text :description
      t.references :rentable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
