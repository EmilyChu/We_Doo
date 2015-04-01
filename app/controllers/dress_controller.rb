class DressController < ActionController::Base

  def index
    @dress = Dress.all
    favorites = Favorite.all
    @faves = favorites.map { |f| f.dress_id }
  end

  def new
    @dress = Dress.new
  end

  def create
    @dress = Dress.new(dress_params)
    if @dress.save
      redirect_to dress_path(@dress)
    else
      render :new #redirect_to dress_path(@dress)
    end
  end

  def show
    @dress = Dress.find(params[:id])
  end

  def vote
    dress = Dress.find(params[:id])
    if current_user.vote_for dress
      #FIXME flash messages aren't showing up?
      flash[:notice] = "Your vote has been recorded!"
    else
      flash[:error] = "You are out of votes!"
    end
    redirect_to :back
  end

  def favorite
    dress = Dress.find(params[:id])
    if current_user.bride
      current_user.favorite dress
      redirect_to :back
      flash[:notice] = "This dress has been favorited!"
    end
  end

  def unfavorite
    dress = Dress.find(params[:id])
    if current_user.bride
      current_user.unfavorite dress
      flash[:notice] = "This dress has been UNfavorited!"
    else
      flash[:error] = "Only the bride is allowed to UNfavorite a dress."
    end
    redirect_to :back
  end

  private 
    def dress_params
      params.require(:dress).permit(:name, :image, :remote_image_url)
    end
end