class SpeciesController < ApplicationController

  @@data = File.read("app/assets/javascripts/species_list.json")

  def creature
    @tax = ["kingdom_name", "phylum_name", "class_name", "order_name", "family_name", "genus_name", "species_name", "full_name", "english_names", "current_listing"]
    @creatures = JSON.parse(@@data)
    @creature = @creatures.select {|c| c["full_name"] == params["name"] }
    if @creature.length == 1
      @creature = @creature.shift.select{|k,v| @tax.include? k}
      begin
        timeout(4) do
          @images ||= Google::Search::Image.new(:query => params["name"], :image_size => :medium).take(4).map(&:thumbnail_uri)
        end
      rescue OpenURI::HTTPError, SocketError, TimeoutError
        []
      end
    else
      flash[:notice] = "We didn't find the creature"
      redirect_to root_path
    end
  end

end
