class RoomsController < ApplicationController
  def index
    @airports = Airport.order(:name)
  end

  def show
    @airport = Airport.find_by(code: params[:id])
    redirect_to root_path, alert: "Airport not found" and return unless @airport
    
    @room = Room.find_or_create_by!(airport: @airport)
    @messages = @room.last_1000_messages
  end
end
