class ActorsController < ApplicationController
  def index
    @list_of_actors = Actor.all
    render({:template=> "actors_templates/index.html.erb"})
  end
  
  def single_actor
    @id=params.fetch("id")
    @actor=Actor.find(@id)

    @films=Character.where({:actor_id=>@id}) # films the actor played
    render({:template=> "actors_templates/single_actor.html.erb"})
  end
end
