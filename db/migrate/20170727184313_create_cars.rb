class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.references :vehicle_info, foreign_key: true
      t.string :engine, limit: 50
      t.string :horsepower, limit: 50
      t.string :torque, limit: 50
      t.integer :doors, limit: 2
      t.integer :seats, limit: 2
      t.references :chassi, foreign_key: { to_table: :meta_sources }, index:true
      t.references :transmission, foreign_key: { to_table: :meta_sources }, index:true
      t.references :fuel_type, foreign_key: { to_table: :meta_sources }, index:true

      t.timestamps
    end
  end
end
