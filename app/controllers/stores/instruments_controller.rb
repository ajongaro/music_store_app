class  Stores::InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.where(store_id: params[:id])
    @store = Store.find(params[:id])
  end

  def new
    @store = Store.find(params[:id])
  end

  def create
    instrument = Instrument.create!(instrument_params)
    redirect_to "/stores/#{instrument.store_id}/instruments/"
  end
  
  private
  def instrument_params
    params.permit(:name, :used, :needs_repair, :price, :store_id)
  end
end





