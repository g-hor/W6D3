class Artwork < ApplicationRecord
  validates :title, presence: true, uniqueness: { scope: :artist_id }
  validates :image_url, uniqueness: true, presence: true
  validates :artist_id, presence: true
  
end
