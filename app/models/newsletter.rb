class Newsletter < ActiveRecord::Base
  # Send subscription data to Mailchimp before saving to database.
  before_save :mailchimp
  
  # Newsletter validations and settings.
  validates :first_name, presence: true, length: { minimum: 3, maximum: 32 }
  validates :last_name, presence: true, length: { minimum: 3, maximum: 32 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { minimum: 3, maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
    
  protected
    
    # Connects with Mailchimp and sends subscription data.
    def mailchimp
      mailchimp = Mailchimp::API.new("6c1991e9312556e0235c650b9e4ef48c-us12")
      mailchimp.lists.subscribe("4de1b79f01",
                               { email: self.email },
                               { 'FNAME' => self.first_name, 'LNAME' => self.last_name })
    end
end