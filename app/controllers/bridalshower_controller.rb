class BridalshowerController < ApplicationController
  def index
    @availability = Availability.all
  end


end