class Customer < ActiveRecord::Base
	has_many :microposts, dependent: :destroy
	has_many :active_relationships, class_name: "Relationship",
									foreign_key: "follower_id",
									dependent: :destroy
	has_many :passive_relationships, class_name: "Relationship",
									foreign_key: "followed_id",
									dependent: :destroy
	has_many :following, through: :active_relationships, source: :followed
	has_many :followers, through: :active_relationships, source: :follower

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
    	following_ids = "SELECT followed_id FROM relationships
                     WHERE  follower_id = :customer_id"
    Micropost.where("customer_id IN (#{following_ids})
                     OR customer_id = :customer_id", customer_id: id)
  	end

	def follow(other_customer)
		active_relationships.create(followed_id: other_customer.id)
	end

	def unfollow(other_customer)
		active_relationships.find_by(followed_id: other_customer.id).destroy
	end

	def following?(other_customer)
		following.include?(other_customer)
	end

	private

	def downcase_email
      self.email = email.downcase
    end

end
