class ActorsController < ApplicationController
  def index 
    render(:template => "/actor_templates/list")
  end 
  def show 
    @actor_num = params.fetch("actor_id")

    @matching_records = Actor.where({:id => @actor_num})
    @the_actor = @matching_records.at(0)

    render(:template => "/actor_templates/details")
  end 
end 
