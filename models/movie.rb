require_relative("../db/sql_runner")

class Movie

  attr_reader :id
  attr_accessor :title, :genre, :rating

  def initialize( options )

    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @rating = options['rating']

  end



  def save()
    sql = "INSERT INTO movies(title, genre, rating)
          VALUES ($1, $2, $3)
          RETURNING id"
    values = [@title, @genre, @rating]
    movie = SqlRunner.run( sql, values ).first
    @id = movie['id'].to_i
  end


  def actors()

    sql = "SELECT actors.*
          FROM actors
          INNER JOIN castings
          ON actors.id = castings.actor_id
          WHERE castings.movie_id = $1;"
    values = [@id]
    actors = SqlRunner.run( sql, values )
    return actors.map {|actor| Actor.new(actor)}


  end


  def update()
    sql = "UPDATE movies
          SET (title, genre, rating) = ($1, $2, $3)
          WHERE id = $4"
    values = [@title, @genre, @rating, @id]
    SqlRunner.run(sql, values)

  end

  def delete()
    sql = "DELETE FROM movies
          WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end



  def self.all()
    sql = "SELECT *
          FROM movies"
    values = []
    movies = SqlRunner.run(sql, values)
    result = movies.map { |movies| Movie.new( movie ) }
    return result
  end


  def self.delete_all()
    sql = "DELETE FROM movies"
    values = []
    SqlRunner.run(sql, values)
  end

end
