class StoresController < ApplicationController
  def index
    # Could abstract this to model
    @stores = Store.created_order
  end

  def show
    @store = Store.find(params[:id])  
    @instruments = Instrument.where(store_id: params[:id])
  end

  def create
    store = Store.create!(store_params)
    redirect_to "/stores/"
  end

  def delete
    @store = Store.find(params[:id])
    @store.destroy
    redirect_to "/stores"
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