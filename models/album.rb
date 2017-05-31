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
      sql = "INSERT INTO album (artist_id, title, genre) VALUES (#{@artist_id}, '#{title}', '#{genre}') RETURNING * ;"
      result = SqlRunner.run(sql)
      @id = result[0]['id'].to_i()
    end

    def self.all()
      sql = "SELECT * FROM album;"
      album_list = SqlRunner.run(sql)
      return album_list.map { |list| Album.new(list) }
    end

end