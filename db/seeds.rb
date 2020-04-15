# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

group_1 = Artist.create(name: "Le Matos", bio: "Electronic band that got its roots in France")

genre_1 = Genre.create(name: "Electronic")

Song.create(name: "Wasteland", artist_id: group_1, genre_id: genre_1)