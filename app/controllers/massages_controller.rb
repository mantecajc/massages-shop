class MassagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_massage, only: %i[ show edit update destroy ]

  # GET /massages or /massages.json
  def index
    filter = params[:filter] || 'massages'
    @categories = Category.where(page: filter).order(:created_at
    )
  end

  # GET /massages/1 or /massages/1.json
  def show
  end

  # GET /massages/new
  def new
    @massage  = Massage.new
    @category = Category.find(params[:category_id])
  end

  # GET /massages/1/edit
  def edit
    @category = @massage.category
  end

  # POST /massages or /massages.json
  def create
    @massage = Massage.new(massage_params)

    respond_to do |format|
      if @massage.save
        @categories = Category.where(page: @massage.category.page)
        format.turbo_stream { flash.now[:success] = "L'article a été créée avec succès." }
        format.html { redirect_to massages_path, notice: "L'article a été créée avec succès." }
      else
        @category = @massage.category
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @massage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /massages/1 or /massages/1.json
  def update
    respond_to do |format|
      if @massage.update(massage_params)
        format.turbo_stream { flash.now[:success] = "L'article a été modifié avec succès." }
        format.html { redirect_to massage_url(@massage), notice: "L'article a été modifié avec succès." }
      else
        @category = @massage.category
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @massage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /massages/1 or /massages/1.json
  def destroy
    page = @massage.category.page
    @massage.destroy

    respond_to do |format|
      format.html { redirect_to massages_url(filter: page), notice: "L'article a été supprimé." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_massage
    @massage = Massage.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def massage_params
    params.require(:massage).permit(:title, :subtitle, :duration, :price, :brief_description, :large_description, :category_id, :photo)
  end
end
