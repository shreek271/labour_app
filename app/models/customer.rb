class Customer < ActiveRecord::Base
	has_many :microposts, dependent: :destroy
	attr_accessor :activation_token
  	before_save   :downcase_email
	validates :name, presence: true, length: { maximum: 25 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 31 },
					format: { with: VALID_EMAIL_REGEX }, 
					uniqueness: { case_sensitive: false }
	
	validates :dob, presence: true
	validates :gender, presence: true
	validates :country, presence: true

	has_secure_password

	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

	def feed
		Micropost.where("customer_id = ?", id)
	end

	private

	def downcase_email
      self.email = email.downcase
    end

end
