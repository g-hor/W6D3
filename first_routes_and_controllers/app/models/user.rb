# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string           not null
#
class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true

    has_many :artworks,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :Artwork,
        dependent: :destroy,
        inverse_of: :artist


    has_many :shares,
        primary_key: :id,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare,
        dependent: :destroy,
        inverse_of: :viewer

    has_many :artwork_shares,
        through: :shares,
        source: :artwork

    has_many :my_shares,
        through: :artworks,
        source: :shares


    has_many :shared_artworks,
        through: :my_shares,
        source: :artwork
end
