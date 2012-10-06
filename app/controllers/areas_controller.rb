class AreasController < ApplicationController
  before_filter :load
  
  def load
    @area = Area.new
    @title = t("areas")
  end
  
  def index
    @areas = Area.all
  end

  def new
  end

  def edit
    @area = Area.find(params[:id])
  end

  def create
    @area = Area.new(params[:area])

    respond_to do |format|
      if @area.save
        format.html { redirect_to areas_url, :flash => { :notice => (t 'flash_notice', :word => (t 'word_save')) }  }
      else
        flash.now[:alert] = (t 'flash_alert', :word => (t 'word_save'))
        format.html { render action: "new" }
      end
    end
  end

  def update
    edit

    respond_to do |format|
      if @area.update_attributes(params[:area])
        format.html { redirect_to areas_url, :flash => { :notice => (t 'flash_notice', :word => (t 'word_update')) } }
      else
        flash.now[:alert] = (t 'flash_alert', :word => (t 'word_update'))
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    edit
    @area.destroy

    respond_to do |format|
      format.html { redirect_to areas_url }
    end
  end
end