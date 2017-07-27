class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.references :owner, index: true, references: :meta_sources, foreign_key: { to_table: :users }
      t.string :type, limit: 255
      t.string :model, limit: 255
      t.string :license_plate, limit: 50
      t.integer :year, limit: 4
      t.string :branch, limit: 50
      t.string :description, limit: 1000
      t.boolean :rent_publish
      t.references :chassi, index: true, references: :meta_sources, foreign_key: { to_table: :meta_sources }
      t.integer :engine, limit: 6
      t.string :horsepower, limit: 50
      t.integer :doors, limit: 2
      t.integer :seats, limit: 2
      t.references :transmission, index: true, references: :meta_sources, foreign_key: { to_table: :meta_sources }
      t.references :fuel_type, index: true, references: :meta_sources, foreign_key: { to_table: :meta_sources }
      t.timestamps
    end
  end
end
