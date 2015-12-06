class RemoveLookingForFromPost < ActiveRecord::Migration
  def change
    remove_column :posts, :looking_for
  end
end
