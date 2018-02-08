require_relative("../db/sql_runner")

class Actor

  attr_reader :id
  attr_accessor :first_name, :second_name

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end



  def save()
    sql = "INSERT INTO actors(first_name, last_name)
          VALUES($1, $2)
          RETURNING id"
    values = [@first_name, @last_name]
    actor = SqlRunner.run( sql, values ).first
    @id = actor['id'].to_i
  end


  def movies()

    sql = "SELECT movies.*
          FROM movies
          INNER JOIN castings
          ON movies.id = castings.movie_id
          WHERE actor_id = $1;"
    values = [@id]
    movies = SqlRunner.run( sql, values )
    return movies.map {|movie| Movie.new(movie)}

  end

  def update()
    sql = "UPDATE actors
          SET (first_name, last_name) = ($1, $2)
          WHERE id = $3"
    values = [@first_name, @last_name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM actors
          WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


  def self.all()
    sql = "SELECT *
          FROM actors"
    values = []
    actors = SqlRunner.run(sql, values)
    result = actors.map { |actor| Actor.new( actor ) }
    return result
  end


  def self.delete_all()
    sql = "DELETE FROM actors"
    values = []
    SqlRunner.run(sql, values)
  end

end
