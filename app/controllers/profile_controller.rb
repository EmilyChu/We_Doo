class ProfileController < ActionController::Base
  def new
  end

  def edit
    @states = Madison.states
  end

end