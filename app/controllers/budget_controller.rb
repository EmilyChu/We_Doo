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

  # def update
  #   @budget = Budget.find(params[:id])
  #   if @budget.update(budget_params)
  #     redirect_to budget_index_path(@budget)
  #   else
  #     flash[:error] = "Something went wrong!"
  #     render :index 
  #   end
  # end

  def update
    params.each do |cat, amt| 
      array = ["utf8", "_method", "authenticity_token", "controller","action"]
      next if array.include?(cat)
      next if amt == ""
      Budget.find_by_category(cat).update cost: amt
    end
    redirect_to budget_index_path
  end

  def destroy
    @budget = Budget.find(params[:id])
    @budget.destroy

    redirect_to budget_index_path
  end

  private
    def budget_params
      # params.require(:budget).permit(:category, :cost)
      params.permit("category", "cost")
    end

end