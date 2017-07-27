class CreateMetaSources < ActiveRecord::Migration[5.1]
  def change
    create_table :meta_sources do |t|
      t.string :type, limit: 255, null: false
      t.string :label, limit: 255, null: false
      t.string :value, limit: 255, null: false

      t.timestamps
    end
  end
end
