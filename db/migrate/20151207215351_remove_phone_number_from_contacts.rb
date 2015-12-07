class RemovePhoneNumberFromContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :phone_number, :integer
  end
end
