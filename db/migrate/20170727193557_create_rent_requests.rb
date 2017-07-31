class CreateRentRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :rent_requests do |t|
      t.references :vehicle_info, foreign_key: true
      t.references :rent_setting, foreign_key: true
      t.references :user, foreign_key: true
      t.references :status, foreign_key: { to_table: :meta_sources }, index:true
      t.date :from_date, null: false
      t.date :to_date, null: false

      t.timestamps
    end
  end
end
