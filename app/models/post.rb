class Post < ActiveRecord::Base
  mount_uploader :post_image, PostImageUploader
  # Tags instead of looking_for.
  acts_as_taggable_on :skills
  belongs_to :user
  has_many :interests
  has_many :users, through: :interests
  
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 32 }
  validates :content, presence: true, length: { maximum: 512 }
  # validates :looking_for, presence: true, length: { maximum: 64 }
  validate :image_size
  
  default_scope -> { order(created_at: :desc) }
  
  private

    # Validates the size of an uploaded picture.
    def image_size
      if post_image.size > 2.megabytes
        errors.add(:post_image, "should be less than 2MB")
      end
    end
end