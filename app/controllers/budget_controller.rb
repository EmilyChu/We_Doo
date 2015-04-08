class BudgetController < ApplicationController
  
  def index
    @budget=Budget.all
  end

  def create
    @budget = Budget.new(budget_params)
    if @budget.save
      redirect_to budget_index_path
    else
      flash[:error] = "Something went wrong!"
    end
  end

  def update
    @budget = Budget.find(params[:id])
    if @budget.update(budget_params)
      redirect_to budget_index_path(@budget)
    else
      flash[:error] = "Something went wrong!"
      render :index 
    end
  end

  private
    def budget_params
      # params.require(:budget).permit(:category, :cost)
      params.permit("category", "cost")
    end

end