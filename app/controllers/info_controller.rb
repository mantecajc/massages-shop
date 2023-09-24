class InfoController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index contact]

  def index
    @marker = [{
      lat: 47.5245343,
      lng: -0.7441239,
      info_window_html: render_to_string(partial: 'info_window')
    }]
  end

  def contact
    UserMailer.contact_email(@user).deliver_now
  end
end
