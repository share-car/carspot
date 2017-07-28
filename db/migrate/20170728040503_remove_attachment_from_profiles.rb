class RemoveAttachmentFromProfiles < ActiveRecord::Migration[5.1]
  def change
    remove_reference :profiles, :attachment, foreign_key: true
  end
end
