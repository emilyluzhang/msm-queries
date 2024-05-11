class MoviesController < ApplicationController
  def index 
    render({:template => "/movie_templates/list"})
  end 
  def show 
    @movie_num = params.fetch("movie_id")
    @matching_records = Movie.where({:id => @movie_num})
    @the_movie = @matching_records.at(0)


    render({:template => "/movie_templates/details"})
  end 
end 
