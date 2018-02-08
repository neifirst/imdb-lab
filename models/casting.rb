require_relative("../db/sql_runner")

class Casting

  attr_reader :id
  attr_accessor :movie_id, :actor_id, :fee

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @actor_id = options['actor_id'].to_i
    @movie_id = options['movie_id'].to_i
    @fee = options['fee']
  end



  def save()
    sql = "INSERT INTO castings(actor_id, movie_id, fee)
          VALUES($1, $2, $3)
          RETURNING id"
    values = [@actor_id, @movie_id, @fee]
    casting = SqlRunner.run( sql,values ).first
    @id = casting['id'].to_i
  end


  def movies()
    sql = "SELECT *
          FROM movies
          WHERE id = $1"
    values = [@movie_id]
    movie = SqlRunner.run( sql,values )[0]
    return Movie.new(Movie)
  end


  def actors()
    sql = "SELECT *
          FROM actors
          WHERE id = $1"
    values = [@actor_id]
    actor = SqlRunner.run( sql,values )[0]
    return Actor.new(actor)
  end


  def update()
    sql = "UPDATE castings
          SET (actor_id, movie_id, fee) = ($1, $2, $3)
          WHERE id = $4"
    values = [@actor_id, @movie_id, @fee, @id]
    SqlRunner.run(sql, values)
  end


  def delete()
    sql = "DELETE FROM castings
          WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


  def self.all()
    sql = "SELECT *
          FROM castings"
    castings = SqlRunner.run(sql)
    result = castings.map { |casting| Casting.new( casting ) }
    return result
  end


  def self.delete_all()
    sql = "DELETE FROM castings"
    SqlRunner.run(sql)
  end

end
