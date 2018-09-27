class UnitsController < ApplicationController
  def index
    @q = Unit.ransack(params[:q])
    @q.sorts = 'name desc' if @q.sorts.empty?
    @units = @q.result(distinct: true).page(params[:page])
    
  end

  def show
  end

  def edit
  end
end
