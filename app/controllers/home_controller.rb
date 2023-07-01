class HomeController < ApplicationController
  def index
    @home = Home.first
    @title = @home.try(:title)
    @description = @home.try(:description)
    @primary_photo = @home.try(:primary_photo)
    @secondary_photo = @home.try(:secondary_photo)
  end

  def edit
    @home = Home.find(params[:id])
  end

  # Tutorial:
  # https://www.bearer.com/blog/how-to-build-modals-with-hotwire-turbo-frames-stimulusjs
  def update
    # byebug
    @home = Home.find(params[:id])

    respond_to do |format|
      if @home.update(home_params)
        format.turbo_stream { render turbo_stream: turbo_stream.replace('home_body', partial: "home/home_body", locals: { home: @home }) }
        format.html { redirect_to home_index_path, notice: "Home was successfully updated." }
        # format.json { render :index, status: :ok, location: @home }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
      # if @post.update(post_params)
      #   format.turbo_stream { render turbo_stream: turbo_stream.replace(@post, partial: "posts/post", locals: {post: @post}) }
      #   format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
      #   format.json { render :show, status: :ok, location: @post }
      # end
    end

    # if @home.update(home_params)
    #   redirect_to home_index_path, notice: "Model was successfully updated."
    # else
    #   render :edit
    # end
  end

  private

  def home_params
    params.require(:home).permit(:title, :description, :primary_photo, :secondary_photo)
  end
end