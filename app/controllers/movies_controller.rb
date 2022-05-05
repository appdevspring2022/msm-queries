class MoviesController < ApplicationController
  def index
    @list_of_movies = Movie.all
    render({:template=> "movies_templates/index.html.erb"})
  end
  
  def single_movie
    @id=params.fetch("id")
    # movie.where({:id => @id}).at(0)
    @movie=Movie.find(@id)

    # @film = Movie.where({:movie_id=>@id})
    render({:template=> "movies_templates/single_movie.html.erb"})
  end
end
