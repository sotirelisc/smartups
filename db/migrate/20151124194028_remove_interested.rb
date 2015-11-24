class RemoveInterested < ActiveRecord::Migration
  def change
    drop_table :interested
  end
end
