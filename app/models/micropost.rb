class Micropost < ActiveRecord::Base
  belongs_to :customer
  default_scope -> { order(created_at: :desc)}
  mount_uploader :photo, PhotoUploader

  validates :customer_id, presence: true
  validates :content, presence: true, length:{ maximum: 140}
  validate :photo_size

  def photo_size
  	if photo.size > 5.megabytes
  		error.add(:photo, "should be less than 5MB")
  	end
  end
end
