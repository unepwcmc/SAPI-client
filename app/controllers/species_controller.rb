class SpeciesController < ApplicationController
require 'json'

  @@data = File.read("app/assets/javascripts/species_list.json")

  def creature
    @tax = ["kingdom_name", "phylum_name", "class_name", "order_name", "family_name", "genus_name", "species_name", "full_name", "english_names", "polish_names", "current_listing"]
    @creatures = JSON.parse(@@data)
    @creature = @creatures.select {|c| c["full_name"] == params["name"] }
    if @creature.length == 1
      @creature = @creature.shift.select{|k,v| @tax.include? k}
    else
      flash[:notice] = "We didn't find the creature"
      redirect_to root_path
    end
  end

end
