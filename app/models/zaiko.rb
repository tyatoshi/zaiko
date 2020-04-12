class Zaiko < ApplicationRecord
  
  validates :content, presence: true, length: { maximum: 50 }
  validates :number, presence: true
  
  belongs_to :user
  has_many :trends, dependent: :destroy
  
  mount_uploader :image_name, ImageUploader
end
