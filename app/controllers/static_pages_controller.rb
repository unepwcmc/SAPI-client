class StaticPagesController < ApplicationController

	@@data = File.read("app/assets/javascripts/temp.json")
  @@polish_creatures = File.read("app/assets/javascripts/species_list.json")

	def math_map_compact
	  render :json => @@data
	end

  def home
    gon.creatures = JSON.parse(@@polish_creatures)
  end

  def help
  end
end
