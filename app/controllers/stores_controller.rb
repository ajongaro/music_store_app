class StoresController < ApplicationController
  def index
    @stores = Store.order(created_at: :asc)
  end

  def show
    @store = Store.find(params[:id])  
    @instruments = Instrument.where(store_id: params[:id])
  end
end