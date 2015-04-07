class BudgetController < ApplicationController
  
  def index
    @budget=Category.all
  end
end