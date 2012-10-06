class InspectionsController < ApplicationController
  before_filter :load
  
  def load
    @inspection = Inspection.new
    @title = t("inspections")
  end
  
  
  def index
    @inspections = Inspection.all
  end

  def show
    @inspection = Inspection.find(params[:id])
  end

  def new
  end

  def edit
    show
  end

  def create
    @inspection = Inspection.new(params[:inspection])

    respond_to do |format|
      if @inspection.save
        format.html { redirect_to inspections_url, :flash => { :notice => (t 'flash_notice', :word => (t 'word_save')) }  }
      else
        flash.now[:alert] = (t 'flash_alert', :word => (t 'word_save'))
        format.html { render action: "new" }
      end
    end
  end

  def update
    show

    respond_to do |format|
      if @inspection.update_attributes(params[:inspection])
        format.html { redirect_to inspections_url, :flash => { :notice => (t 'flash_notice', :word => (t 'word_update')) } }
      else
        flash.now[:alert] = (t 'flash_alert', :word => (t 'word_update'))
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    show
    @inspection.destroy

    respond_to do |format|
      format.html { redirect_to inspections_url }
    end
  end
end
