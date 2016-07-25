require 'rails_helper'

RSpec.describe TicketType, type: :model do
it "belongs to a event" do
  ticket_type = TicketType.new
  event = Event.new
  event.ticket_types << ticket_type
  expect(ticket_type.event).to be event
  end
  




end
