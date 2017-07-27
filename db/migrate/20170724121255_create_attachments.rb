class CreateAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :attachments do |t|
      t.string :type, limit: 255, null: false
      t.string :name, limit: 255, null: false
      t.string :description, limit: 1000
      t.references :user, foreign_key: true
      t.timestamps
    end
    
    add_index :attachments, :name
  end
end
