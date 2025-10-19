class AirportsController < ApplicationController
  def search
    query = params[:q].to_s.strip
    @airports = query.present? ? Airport.search(query) : []
    
    render json: @airports.map { |a| { code: a.code, name: a.name, city: a.city, country: a.country } }
  end
end
