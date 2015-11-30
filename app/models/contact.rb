class Contact < ActiveRecord::Base
  validates :full_name, presence: true, length: { minimum: 3, maximum: 40 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, 
    presence: true,
    length: {minimum: 3, maximum: 255},
    format: {with: VALID_EMAIL_REGEX}
  validates :message, presence: true, length: { minimum: 4, maximum: 400}
  validates :phone_number,
    :numericality => true,
    :length => { :minimum => 10, :maximum => 15 }
end
