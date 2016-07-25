require 'rails_helper'

RSpec.describe TicketTypesController, type: :controller do
it "should get new" do
  get 'new'
  response.should be_success
end

it "should create ticket type" do 
   tickettype_params = FactoryGirl.attributes_for(:ticket_type)
   expect { post :create, :ticket_type => tickettype_params }.to change(TicketType, :count).by(1) 
end
end 
