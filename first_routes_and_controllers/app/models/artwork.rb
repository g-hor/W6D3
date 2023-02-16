# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord

  attr_reader :id

  validates :title, presence: true, uniqueness: { scope: :artist_id }
  validates :image_url, uniqueness: true, presence: true
  validates :artist_id, presence: true

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User

  has_many :shares_viewers,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare,
    dependent: :destroy,
    inverse_of: :artwork
  
end
