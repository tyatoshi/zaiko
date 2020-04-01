class Zaiko < ApplicationRecord
  
  validates :content, presence: true, length: { maximum: 50 }
  validates :number, presence: true
  
  belongs_to :user
  
  mount_uploader :image_name, ImageUploader
end
