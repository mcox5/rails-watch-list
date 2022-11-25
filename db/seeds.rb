require 'json'
require 'open-uri'


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Movie.destroy_all # RECORDAR CONVENCION DE DESTRUIR TODO LO DE LA BASE DE DATOS ARRIBA DEL SEED, PARA EVITAR QUE SE APILEN
# Llamamos a la API
url = 'http://tmdb.lewagon.com/movie/top_rated'
user_serialized = URI.open(url).read
user = JSON.parse(user_serialized)
results = user['results']
results.each do |movie|
  Movie.create(
    title: movie['original_title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}",
    rating: movie['vote_average']
  )
end
