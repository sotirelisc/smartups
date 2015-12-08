class Post < ActiveRecord::Base
  # Uploader for Smartup Post image.
  mount_uploader :post_image, PostImageUploader
  
  # Tags instead of looking_for.
  acts_as_taggable_on :skills
  
  # Smartup Post relations and settings.
  belongs_to :user
  has_many :interests
  has_many :users, through: :interests
  
  # Smartup Post validations.
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 32 }
  validates :content, presence: true, length: { maximum: 512 }
  # Skip skills field validation when seeding.
  validates :skills, presence: true, unless: :skip_skills_validation
  # validates :looking_for, presence: true, length: { maximum: 64 }
  validate :image_size
  
  attr_accessor :skip_skills_validation
  
  default_scope -> { order(created_at: :desc) }
  
  private

    # Validates the size of an uploaded picture.
    def image_size
      if post_image.size > 2.megabytes
        errors.add(:post_image, "should be less than 2MB")
      end
    end
end