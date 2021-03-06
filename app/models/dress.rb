class Dress < ActiveRecord::Base
  #attr_accessor :image, :remote_image_url 

  belongs_to :user
  has_many   :votes
  has_many   :favorites

  mount_uploader :image, AvatarUploader
end
