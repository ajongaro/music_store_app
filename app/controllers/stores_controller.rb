class StoresController < ApplicationController
  def index
    @stores = Store.order(created_at: :asc)
  end

  def show
    @store = Store.find(params[:id])  
    @instruments = Instrument.where(store_id: params[:id])
  end

  def create
    store = Store.create!(
      name: params[:name],
      online_only: params[:online_only],
      max_inventory: params[:max_inventory],
      customer_rating: params[:customer_rating]
    )
    redirect_to "/stores/"
  end
end