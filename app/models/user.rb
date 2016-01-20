class User < ActiveRecord::Base
  # Uploader for User profile picture.
  mount_uploader :profile_pic, UserImageUploader
  
  # User skills in form of tags.
  acts_as_taggable_on :skills
  
  # User notifications.
  # The sender is usually the interested user.
  has_many :sent_notifications, :class_name => 'Notification', :foreign_key => 'sender_id'
  # The recipient is the one getting the notification.
  has_many :received_notifications, :class_name => 'Notification', :foreign_key => 'recipient_id'
  
  # User relations and settings.
  has_many :interests
  has_many :posts, dependent: :destroy, through: :interests
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  
  # User validations.
  validates :first_name, presence: true, length: { minimum: 3, maximum: 64 }
  validates :last_name, presence: true, length: { minimum: 3, maximum: 64 }
  validate :image_size
  
  # Returns user's fullname.
  def full_name
    "#{first_name} #{last_name}"
  end
  
  def new_user?
    Date.today - created_at.to_date <= 2
  end
  
  private

    # Validates the size of an uploaded picture.
    def image_size
      if profile_pic.size > 2.megabytes
        errors.add(:profile_pic, "should be less than 2MB")
      end
    end
end