class  Stores::InstrumentsController < ApplicationController
  def index
    @store = Store.find(params[:id])

    if params[:alpha_sort]
      @instruments = Instrument.alpha_sort
    else
      @instruments = Instrument.where(store_id: params[:id])
    end
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





