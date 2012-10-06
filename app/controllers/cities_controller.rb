class CitiesController < ApplicationController
  def index
    @cities = State.find(params[:state_id]).cities
    respond_to do |format|
      format.json { render :json => @cities }
    end
  end
end