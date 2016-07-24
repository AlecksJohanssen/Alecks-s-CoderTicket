class VenuesController < ApplicationController

  def new 
    @venue = Venue.new
    @regions= Region.all
  end

  def create
    @venue = Venue.new (venue_params)
      if @venue.save
        redirect_to root_path, notice: "Venue Created"
      else
        raise "WTF"
      end
  end

  private
  def venue_params
    params.require(:venue).permit(:name,:full_address,:region_id)
  end
end
