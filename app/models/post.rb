class Post < ActiveRecord::Base
  belongs_to :user
  has_many :interests
  has_many :users, through: :interests
  
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 32 }
  validates :content, presence: true, length: { maximum: 512 }
  validates :looking_for, presence: true, length: { maximum: 64 }
  
  default_scope -> { order(created_at: :desc) }
end