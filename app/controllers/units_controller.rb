class UnitsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @q = Unit.ransack(params[:q])
    @q.sorts = 'name asc' if @q.sorts.empty?
    @units = @q.result(distinct: true).page(params[:page])

    
  end

  def edit
  end
end
