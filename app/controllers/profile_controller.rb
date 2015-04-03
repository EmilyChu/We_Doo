class ProfileController < ApplicationController
  def new
  end

  def edit
    @profile = User.find(params[:id])
    @states = Madison.states
  end

  def update
    @profile = User.find(params[:id])
    if @profile.update(profile_params)
      redirect_to profile_path(@profile)
    else
      render :edit
    end
  end

 
private
  def profile_params
    params.require(:user).permit(:name, :hometown, :story)
  end

end