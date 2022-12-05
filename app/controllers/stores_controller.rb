class StoresController < ApplicationController
  def index
    @stores = Store.order(created_at: :asc)
  end

  def show
    @store = Store.find(params[:id])  
    @instruments = Instrument.where(store_id: params[:id])
  end

  def create
    store = Store.create!(store_params)
    redirect_to "/stores/"
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    store = Store.find(params[:id])
    store.update(store_params)
    redirect_to "/stores/#{store.id}/"
  end

  private 
  def store_params
    params.permit(:name, :online_only, :max_inventory, :customer_rating)
  end
end