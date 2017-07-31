class CreateServiceOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :service_options do |t|
      t.string :label, limit: 255, null: false
      t.integer :price, default: 0, null: false
      t.string :desciption, limit: 1000
      t.references :rent_setting, foreign_key: true

      t.timestamps
    end
  end
end
