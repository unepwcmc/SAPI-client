class SpeciesController < ApplicationController
require 'json'

  @@data = File.read("app/assets/javascripts/species_list.json")

  def creature
    @creatures = JSON.parse(@@data)
    @creature = @creatures.select {|c| c["full_name"] == params["name"] }
  end

end
