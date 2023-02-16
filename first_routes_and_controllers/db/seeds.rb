# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do

  User.destroy_all
  Artwork.destroy_all
  ArtworkShare.destroy_all

  %w(users artworks artwork_shares).each do |table_name|
    ApplicationRecord.connection.reset_pk_sequence!(table_name)
  end


  #users
  u1 = User.create!(username: "Shan")
  u2 = User.create!(username: "Gary")
  u3 = User.create!(username: "Alvin")
  u4 = User.create!(username: "Amin")


  #artworks
  a1 = Artwork.create!(title: "whatever", image_url: "1", artist_id: 1)
  a2 = Artwork.create!(title: "alsowhatever", image_url: "2", artist_id: 1)
  a3 = Artwork.create!(title: "monalisa", image_url: "3", artist_id: 3)
  a4 = Artwork.create!(title: "inches", image_url: "4", artist_id: 4)


  #artworkshares
  as1 = ArtworkShare.create!(artwork: a1, viewer: u1)
  as2 = ArtworkShare.create!(artwork: a1, viewer: u2)
  as3 = ArtworkShare.create!(artwork: a2, viewer: u3)
  as4 = ArtworkShare.create!(artwork: a3, viewer: u1)
  as5 = ArtworkShare.create!(artwork: a4, viewer: u1)



end