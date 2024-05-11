class ActorsController < ApplicationController
  def index 
    render(:template => "/actor_templates/list")
  end 
  def show 
    @actor_num = params.fetch("actor_id")

    @matching_records = Actor.where({:id => @actor_num})
    @the_actor = @matching_records.at(0)

    @char = Character.where({:actor_id => @the_actor.id})
    
    # collect list of movie_id's to match on
    @movie_array = Array.new
    @char.each do |character|
      @movie_array.push(character.movie_id)
    end 

    render(:template => "/actor_templates/details")
  end 
end 
