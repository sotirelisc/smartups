class User < ActiveRecord::Base
  acts_as_taggable_on :skills
  has_many :interests
  has_many :posts, dependent: :destroy, through: :interests
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, presence: true, length: { minimum: 4, maximum: 64 }
  validates :last_name, presence: true, length: { minimum: 4, maximum: 64 }
end
