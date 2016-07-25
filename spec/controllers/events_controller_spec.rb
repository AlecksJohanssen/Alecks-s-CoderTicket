require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET event" do
    it "renders the events view" do
      get :events
      expect(response).to render_template :event
  end
  end
  end
