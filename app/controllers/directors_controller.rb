class DirectorsController < ApplicationController
  require 'time'
  def index
    @list_of_directors = Director.all
    render({:template=> "directors_templates/index.html.erb"})
  end

  def eldest
    @eldest=Director.where.not({:dob=>nil}).order({:dob=>:asc}).at(0)
    render({:template=> "directors_templates/eldest.html.erb"})
  end

  def youngest
    @youngest=Director.order({:dob=>:desc}).at(0)
    render({:template=> "directors_templates/youngest.html.erb"})
  end
  
  def single_director
    @id=params.fetch("id")
    # Director.where({:id => @id}).at(0)
    director=Director.find(@id)
    @name=director.name
    @dob=director.dob
    @bio=director.bio
    @image=director.image
    @create=director.created_at
    @update=director.updated_at

    @film = Movie.where({:director_id=>@id})
    render({:template=> "directors_templates/single_director.html.erb"})
  end
end
