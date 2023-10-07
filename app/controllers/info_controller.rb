class InfoController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index contact]

  def index
    @info = Info.first
    @marker = [{
      lat: 47.5245343,
      lng: -0.7441239,
      info_window_html: render_to_string(partial: 'info_window')
    }]
  end

  def contact
    # TODO PROD: check that deliver_now works.
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

  def edit
    @info = Info.find(params[:id])
  end

  def update
    @info = Info.find(params[:id])

    respond_to do |format|
      if @info.update(info_params)
        format.turbo_stream { flash.now[:success] = "La page d'information a été mise à jour avec succès." }
        format.html { redirect_to info_index_path, notice: "La page d'information a été mise à jour avec succès." }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @info.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def info_params
    params.require(:info).permit(:content)
  end
end
