class InfoController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    # address = "9 Rue du Tabuteau, 49370 Saint-Clément-de-la-Place"
    # coordinates = Geocoder.coordinates(address)
    # if coordinates.present?
    # lat = coordinates[0]
    # lng = coordinates[1]
    @marker = [{
      lat: 47.5245343,
      lng: -0.7441239,
      info_window_html: render_to_string(partial: 'info_window')
    }]
    # end
  end
end
