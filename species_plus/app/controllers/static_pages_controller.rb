class StaticPagesController < ApplicationController

	@@data = File.read("app/assets/javascripts/math_map_compact.json")

	def math_map_compact
	  render :json => @@data
	end

  def home
  end

  def help
  end
end
