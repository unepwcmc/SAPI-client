class StaticPagesController < ApplicationController

  def home
    gon.creatures = JSON.parse(@@polish_creatures)
  end

  def help
  end
end
