# WARNING: As of Aug 13rd, our code often differs from the tutorial's.
# Add/edit with caution!

class Post < ActiveRecord::Base
  
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 32 }
  validates :content, presence: true, length: { maximum: 512 }
  validates :looking_for, presence: true, length: { maximum: 64 }
  
  default_scope -> { order(created_at: :desc) }
  
end