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


    has_many :artwork_shares,
        primary_key: :id,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare,
        dependent: :destroy,
        inverse_of: :viewer

    has_many :shared_artworks,
        through: :artwork_shares,
        source: :artwork

    has_many :comments,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :Comment,
        inverse_of: :author,
        dependent: :destroy
    


    # WE'RE MAD EXTRA HERE
    has_many :my_shares,
        through: :artworks,
        source: :shares


    has_many :artworks_i_created_that_have_been_shared, -> { distinct },
        through: :my_shares,
        source: :artwork
end
