class SpeciesController < ApplicationController
require 'json'

  @@data = File.read("app/assets/javascripts/species_list.json")

  def creature
    @tax = ["kingdom_name", "phylum_name", "class_name", "order_name", "family_name", "genus_name", "species_name", "full_name", "english_names", "polish_names"]
    @creatures = JSON.parse(@@data)
    @creature = @creatures.select {|c| c["full_name"] == params["name"] }.shift.select{|k,v| @tax.include? k}
  end

end
