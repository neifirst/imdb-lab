require_relative( 'models/movie' )
require_relative( 'models/actor' )
require_relative( 'models/casting' )

require( 'pry-byebug' )

Casting.delete_all()
Actor.delete_all()
Movie.delete_all()

movie1 = Movie.new({ 'title' => 'Dark City', 'genre' => 'SciFi', 'rating' => 10 })
movie1.save()
movie2 = Movie.new({ 'title' => 'The Thing', 'genre' => 'Horror', 'rating' => 10 })
movie2.save()
movie3 = Movie.new({ 'title' => 'Leon', 'genre' => 'Thriller', 'rating' => 10 })
movie3.save()


actor1 = Actor.new({ 'first_name' => 'Jeniffer', 'last_name' => 'Connolly'})
actor1.save()
actor2 = Actor.new({ 'first_name' => 'Kieffer', 'last_name' => 'Sutherland'})
actor2.save()
actor3 = Actor.new({ 'first_name' => 'Kurt', 'last_name' => 'Russell'})
actor3.save()
actor4 = Actor.new({ 'first_name' => 'Donald', 'last_name' => 'Moffat'})
actor4.save()
actor5 = Actor.new({ 'first_name' => 'Jean', 'last_name' => 'Reno'})
actor5.save()
actor6 = Actor.new({ 'first_name' => 'Gary', 'last_name' => 'Oldman'})
actor6.save()


casting1 = Casting.new({ 'movie_id' => movie1.id, 'actor_id' => actor1.id, 'fee' => 1000000})
casting1.save()
casting2 = Casting.new({ 'movie_id' => movie1.id, 'actor_id' => actor2.id, 'fee' => 2000000})
casting2.save()
casting3 = Casting.new({ 'movie_id' => movie2.id, 'actor_id' => actor3.id, 'fee' => 500000})
casting3.save()
casting4 = Casting.new({ 'movie_id' => movie2.id, 'actor_id' => actor4.id, 'fee' => 200000})
casting4.save()
casting5 = Casting.new({ 'movie_id' => movie3.id, 'actor_id' => actor5.id, 'fee' => 1000000})
casting5.save()
casting6 = Casting.new({ 'movie_id' => movie3.id, 'actor_id' => actor6.id, 'fee' => 2000000})
casting6.save()


binding.pry
nil
