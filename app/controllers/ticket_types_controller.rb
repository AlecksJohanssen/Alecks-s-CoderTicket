class TicketTypesController < ApplicationController
  def new
    @ticket_type = TicketType.new
    @event = Event.all
    @event= Event.find(params[:id])
  end
  
  def create
    @ticket_type= TicketType.new (tickettype_params)
    if @ticket_type.save
        redirect_to @ticket_type
      else
        render new
      end
  end
  
  private
  def tickettype_params
    params.require(:ticket_type).permit(:price,:name,:event_id,:max_quantity)
  end

end
