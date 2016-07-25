class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :secure_edit_channel, only: [:edit]

  def index
    @events = Event.all
    @events = Event.where(published: true)
      if params[:search]
       @events = Event.search(params[:search])
      end
  end

  def new
    @event = Event.new
    @categories = Category.all
    @venues = Venue.all
    @regions = Region.all
    @ticket_types = TicketType.all
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new (event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
      if @event.update(event_params)
        @event.save
        redirect_to @event
      else
        raise "Cant"
      end
  end

  def update_published
  @event = Event.find(params[:id])
   if @event.update_attributes(published: true)
    redirect_to @event
  else
    render edit
  end
  end

  def secure_edit_channel
    current_user_id = current_user.id
    if current_user_id != @current_id =Event.find(params[:id]).user_id
      redirect_to root_path
    end
  end

  private
  def event_params
    params.require(:event).permit(:name,:extended_html_description,:venue_id,:category_id,:starts_at,:ends_at,:user_id,:ticket_type_id)
  end
end
