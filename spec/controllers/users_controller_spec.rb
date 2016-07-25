require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe UsersController do
    it { should route(:get, '/users').to(action: :index) }
    it { should route(:get, '/users/1').to(action: :show, id: 1) }
    it "routes to #new" do
      get("/users/new").should route_to("users#new")
    end
  end
  end
