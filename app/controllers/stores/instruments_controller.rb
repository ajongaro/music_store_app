class  Stores::InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.where(store_id: params[:id])
    @store = Store.find(params[:id])
  end

  def new
    @store = Store.find(params[:id])
  end

  def create
    store = Store.find(params[:id])
    store.instruments.create!(instrument_params)
    redirect_to "/stores/#{store.id}/instruments/"
  end
  
  private
  def instrument_params
    params.permit(:name, :used, :needs_repair, :price)
  end
end





