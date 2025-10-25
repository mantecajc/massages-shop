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
    html_content = ApplicationController.render(
      partial: "user_mailer/contact_email",
      locals: {
        name: params[:name],
        email: params[:email],
        subject: params[:subject],
        message: params[:message]
      }
    )
    subject = 'Nouveau message | Les Massages de Pauline'
    SendEmailService.new(to: ENV['MAILJET_SENDER_TEST'], html_content: html_content, subject: subject).call

    respond_to do |format|
      format.turbo_stream { flash.now[:success] = 'Merci pour votre message. Nous revenons vers vous très vite !' }
      format.html { redirect_to home_index_path, notice: 'Merci pour votre message. Nous revenons vers vous très vite !' }
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
