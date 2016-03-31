class EventsController < ApplicationController
  def index
    if filter_param.nil?
      @events = Event.published
    else
      @events = Event.find(:all, include: :tags, conditions: ['tag.id IN (?)',filter_param]).distinct
      @filter_ids = filter_param.map {|v|v.to_i}
    end
    respond_to do |format|
      format.html { render }
      format.json { render json: @events }
    end
  end

  def show
    @event = Event.published.find params[:id].to_i
    respond_to do |format|
      format.html { render }
      format.json { render json: @event }
    end
  end

  def new
    @event = Event.new
    respond_to do |format|
      format.html { render }
    end
  end

  def create
    @event = Event.new event_params
    success = @event.save
    respond_to do |format|
      format.html do
        if success
          redirect_to @event
        else
          render :new
        end
      end
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :time, :location, :email, :website, tag_ids: [])
  end

  def filter_param
    params.require(:filter) or nil
  end
end
