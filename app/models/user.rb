class User < ActiveRecord::Base
  has_many :interests
  has_many :posts, dependent: :destroy, through: :interests
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
end
