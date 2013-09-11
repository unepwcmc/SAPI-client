class SpeciesController < ApplicationController
  require 'levenshtein'

def creature
    gon.creatures = JSON.parse(@@polish_creatures)
    if params['name'].blank?
       params['name'] = params['species']['name'].slice(0,1).capitalize + params['species']['name'].slice(1..-1)
    end
    @tax = ["kingdom_name", "phylum_name", "class_name", "order_name", "family_name", "genus_name", "species_name", "full_name", "english_names", "cites_listing"]
    @creatures = gon.creatures
    @creature_full = @creatures.select {|c| c["full_name"] == params["name"] }
    if @creature_full.length == 1
      @creature = @creature_full[0].select{|k,v| @tax.include? k}
      @id_gbif = @creature_full[0]['id_gbif']
      begin
        timeout(4) do
          @images ||= Google::Search::Image.new(:query => params["name"], :image_size => :medium).take(4).map(&:thumbnail_uri)
        end
      rescue OpenURI::HTTPError, SocketError, TimeoutError
        []
      end
    else
      @creature = params["name"]
      @message = "We've found:"
      @species_similar = @creatures.select {|c| Levenshtein.normalized_distance(params['name'], c['full_name']) < 0.65 }
      render "static_pages/home"
    end
  end

end
