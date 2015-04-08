class ScheduleController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @availability = Availability.all
  end

  def show
  end

  def new
    @availability = Availability.new
  end

  def edit
  end

  def create
    @availability = Availability.new(a_params)

    respond_to do |format|
      if @availability.save
        format.html { redirect_to @availability, notice: 'Success created'}
        format.json { render :show, status: :created, location: @availability}
      else
        format.html { render :new }
        format.json { render json: @availability.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
     respond_to do |format|
      if @availability.update(a_params)
        format.html { redirect_to @availability, notice: 'Successfully updated'}
        format.json { render :show, status: :ok, location: @availability}
      else
        format.html { render :edit }
        format.json { render json: @availability.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @availability.destroy
    respond_to do |format|
      format.html { redirect_to schedule_index_path, notice: 'Deleted'}
      format.json { head :no_content }
    end
  end


  private
    def a_params
      params.require(:availability).permit(:name, :start_at)
    end

    def set_event
      @availability = Availability.find(params[:id])
    end
end