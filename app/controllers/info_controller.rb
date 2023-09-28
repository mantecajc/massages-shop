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
    UserMailer.contact_email(
      params[:name],
      params[:email],
      params[:subject],
      params[:message]
    ).deliver_now

    respond_to do |format|
      format.turbo_stream { flash.now[:success] = 'Votre message a été envoyé avec succès' }
      format.html { redirect_to home_index_path, notice: 'Votre message a été envoyé avec succès' }
    end
  end
end
