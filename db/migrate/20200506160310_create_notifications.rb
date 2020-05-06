class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.string :message_id, null: false, index: { unique: true }
      t.text :body

      t.timestamps
    end
  end
end
