class ApplicationController < ActionController::Base
  require 'json'
  require 'open-uri'

  @@polish_creatures = File.read("app/assets/javascripts/species_list_gbif.json")
  include Parser

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
