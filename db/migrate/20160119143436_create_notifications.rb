class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :sender
      t.references :recipient
      t.string :text_msg
      t.references :post
    end
  end
end
