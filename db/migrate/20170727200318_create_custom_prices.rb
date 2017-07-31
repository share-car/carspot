class CreateCustomPrices < ActiveRecord::Migration[5.1]
  def change
    create_table :custom_prices do |t|
      t.date :from_date, null: false
      t.date :to_date, null: false
      t.integer :price, default: 0, null: false
      t.references :rent_setting, foreign_key: true

      t.timestamps
    end
  end
end
