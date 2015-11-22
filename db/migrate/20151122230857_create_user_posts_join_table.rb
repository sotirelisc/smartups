class CreateUserPostsJoinTable < ActiveRecord::Migration
  def change
    create_table :interested, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :post, index: true
    end
  end
end
