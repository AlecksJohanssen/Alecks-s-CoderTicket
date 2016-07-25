require 'rails_helper'

RSpec.describe VenuesController, type: :controller do
it "should creates venue" do 
  venue_params = FactoryGirl.attributes_for(:venue)
  expect { post :create, :venue => venue_params }.to change(Venue, :count).by(1) 
  end
end
