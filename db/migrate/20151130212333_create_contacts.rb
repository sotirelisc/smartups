class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :full_name
      t.integer :phone_number, null: true
      t.string :email
      t.text :message

      t.timestamps null: false
    end
  end
end
