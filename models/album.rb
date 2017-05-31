require 'pg'

class Album

  attr_accessor :title, :genre

    def initialize(options)
      @id = options['id'].to_i()
      @artist_id = options['artist_id'].to_i()
      @title = options['title']
      @genre = options['genre']
    end

    def save()
      sql = "INSERT INTO album (artist_id, title, genre) VALUES (#{@artist_id}, '#{@title}', '#{@genre}') RETURNING * ;"
      result = SqlRunner.run(sql)
      @id = result[0]['id'].to_i()
    end

    def delete()
      sql = "DELETE FROM album WHERE id = #{@id} ;"
      SqlRunner.run(sql)
    end

    def update()
      sql = "UPDATE album SET (artist_id, title, genre) = (#{@artist_id}, '#{@title}', '#{@genre}') WHERE id = #{@id};"
      SqlRunner.run(sql)
    end


    def self.all()
      sql = "SELECT * FROM album;"
      album_list = SqlRunner.run(sql)
      return album_list.map { |list| Album.new(list) }
    end

    def self.delete_all()
      sql = "DELETE FROM album;"
      SqlRunner.run(sql)    
    end

    def album_artist()
      sql = "SELECT * FROM artist WHERE id = #{@artist_id};"
      results = SqlRunner.run(sql)
      artist_data = results[0]
      artist = Artist.new(artist_data)
      return artist
    end

end