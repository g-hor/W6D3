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
  validates :title, presence: true, uniqueness: { scope: :artist_id }
  validates :image_url, uniqueness: true, presence: true
  validates :artist_id, presence: true

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User,
    inverse_of: :artworks

  has_many :shares,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare,
    dependent: :destroy,
    inverse_of: :artwork

  has_many :shared_viewers,
    through: :shares,
    source: :viewer

  has_many :comments,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Comment,
    inverse_of: :artwork,
    dependent: :destroy

  def self.artworks_for_user_id(user_id)
    user = User.find(user_id)
    user.artworks + user.shared_artworks
  end
end
