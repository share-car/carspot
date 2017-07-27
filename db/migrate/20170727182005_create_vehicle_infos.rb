class CreateVehicleInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicle_infos do |t|
      t.references :users, foreign_key: true
      t.string :model, limit: 255, null: false
      t.string :license_plate, limit: 50, null: false
      t.integer :year, limit: 4, null: false
      t.string :branch, limit: 50, null: false
      t.text :description
      t.boolean :rent_publish
      t.references :vehicle, polymorphic: true, index: true
      
      t.timestamps
    end
  end
end
