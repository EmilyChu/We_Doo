class DressController < ActionController::Base

  def index
    @dress = Dress.all
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

  private 
    def dress_params
      params.require(:dress).permit(:name, :image, :remote_image_url)
    end
end