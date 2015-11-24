class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.belongs_to :user, index: true
      t.belongs_to :post, index: true
      t.datetime :interest_date
      t.timestamps null: false
    end
  end
end
