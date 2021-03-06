require "pg"
require_relative "../db/sql_runner"

class Artist

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i()
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artist (name) VALUES ('#{@name}') RETURNING * ;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i()
  end

  def delete()
    sql = "DELETE FROM artist WHERE id = #{@id} ;"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE artist SET (name) = (#{@name}) WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM artist WHERE id = #{id};"
    results = SqlRunner.run(sql)
    artist_search = results.first
    artist_search = Artist.new(artist_serach)
    return artist_serach
  end

  def self.all()
    sql = "SELECT * FROM artist;"
    artist = SqlRunner.run(sql)
    return artist.map { |band| Artist.new(band) }
  end 

  def self.delete_all()
    sql = "DELETE FROM artist;"
    SqlRunner.run(sql)
  end

  def show_albums()
    sql = "SELECT * FROM album WHERE artist_id = #{@id};"
    results = SqlRunner.run(sql)
    albums = results.map { |albums| Album.new(albums)}
    return albums
  end


end