class ProfileController < ApplicationController
  def new
  end

  def edit
    @states = Madison.states
  end

end