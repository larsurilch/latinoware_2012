class PlacesController < ApplicationController
  before_filter :load
  
  def load
    @place = Place.new
    @title = t("places")
  end
  
  def index
    @places = Place.all
  end

  def new
  end

  def edit
    @place = Place.find(params[:id])
  end

  def create
    @place = Place.new(params[:place])

    respond_to do |format|
      if @place.save
        format.html { redirect_to places_url, :flash => { :notice => (t 'flash_notice', :word => (t 'word_save')) }  }
      else
        flash.now[:alert] = (t 'flash_alert', :word => (t 'word_save'))
        format.html { render action: "new" }
      end
    end
  end

  def update
    edit

    respond_to do |format|
      if @place.update_attributes(params[:place])
        format.html { redirect_to places_url, :flash => { :notice => (t 'flash_notice', :word => (t 'word_update')) } }
      else
        flash.now[:alert] = (t 'flash_alert', :word => (t 'word_update'))
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    edit
    @place.destroy

    respond_to do |format|
      format.html { redirect_to places_url }
    end
  end
end