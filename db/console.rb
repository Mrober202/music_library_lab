require 'pry-byebug'
require_relative '../models/album'
require_relative '../models/artist'

Artist.delete_all()
Album.delete_all()

artist1 = Artist.new({
  'name' => 'The Clash'
  })

artist2 = Artist.new({
  'name' => 'Led Zeppellin'
  })

artist1.save()
artist2.save()

album1 = Album.new({
  'artist_id' => artist1.id,
  'title' => 'London Calling',
  'genre' => 'Punk Rock'
  })

album2 = Album.new({
  'artist_id' => artist2.id,
  'title' => 'IV',
  'genre' => 'Hard Rock'
  })

album1.save()
album2.save()



binding.pry
nil