class  Stores::InstrumentsController < ApplicationController
  def index
    @store = Store.find(params[:id])

    return @instruments = Instrument.alpha_sort if params[:alpha_sort]
    return @instruments = Instrument.filter_price(params[:minimum_price]) if params[:minimum_price]
    @instruments = Instrument.where(store_id: params[:id])
  end

  def new
    @store = Store.find(params[:id])
  end

  def create
    store = Store.find(params[:id])
    store.instruments.create!(instrument_params)
    redirect_to "/stores/#{store.id}/instruments"
  end
  
  private
  def instrument_params
    params.permit(:name, :used, :needs_repair, :price)
  end
end





