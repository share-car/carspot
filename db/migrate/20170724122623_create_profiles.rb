class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :first_name, limit: 255, null: false
      t.string :last_name, limit: 255, null: false
      t.string :address, limit: 1000
      t.string :phone, limit: 12
      t.string :identity_card, limit: 255
      t.references :user, foreign_key: true
      t.references :attachment, foreign_key: true

      t.timestamps
    end
  end
end
