class User < ActiveRecord::Base
  mount_uploader :profile_pic, UserImageUploader
  acts_as_taggable_on :skills
  has_many :interests
  has_many :posts, dependent: :destroy, through: :interests
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, presence: true, length: { minimum: 4, maximum: 64 }
  validates :last_name, presence: true, length: { minimum: 4, maximum: 64 }
  validate :image_size
  
  private

    # Validates the size of an uploaded picture.
    def image_size
      if profile_pic.size > 2.megabytes
        errors.add(:profile_pic, "should be less than 2MB")
      end
    end
end