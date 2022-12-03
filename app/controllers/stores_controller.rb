class StoresController < ApplicationController
  def index
    @stores = Store.order(created_at: :asc)
  end

  def show
    @store = Store.find(params[:id])  
  end
end