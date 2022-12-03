class  Stores::InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.where(store_id: params[:id])
    @store = Store.find(params[:id])
  end
end





