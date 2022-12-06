class InstrumentsController < ApplicationController
  def index
    # @instruments = Instrument.all
    @instruments = Instrument.where(used: true)
  end

  def edit
    @instrument = Instrument.find(params[:id])
  end

  def update 
    instrument = Instrument.find(params[:id])
    instrument.update(instrument_params)
    redirect_to "/instruments/#{params[:id]}/"
  end

  def show
    @instrument = Instrument.find(params[:id])
  end

  private
  def instrument_params
    params.permit(:name, :used, :needs_repair, :price)
  end
end