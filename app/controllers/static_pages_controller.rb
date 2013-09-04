class StaticPagesController < ApplicationController

  def home
    gon.creatures = JSON.parse(@@polish_creatures)
  end

  def sad_panda
  end
end
