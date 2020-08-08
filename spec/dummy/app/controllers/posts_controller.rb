class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @collection = collection
  end

  def bootstrap
    @collection = collection
  end

  def show
    @post = resource
  end

  def new
    @post = collection.new
  end

  def create
    @post = collection.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
    @post = resource
  end

  def update
    @post = resource
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def inline_update
    @post = resource
    @result = @post.update(post_params)

    respond_to do |format|
      format.json do
        if @result
          flash = { type: 'success', message: 'Record was successfully updated' }
          render json: { html: helpers.inline_editor_text(value: post_params.values.first, option: post_params.keys.first), flash: flash  }
        else
          flash = { type: 'alert', message: 'Please select option from the list' }
          render json: { status: 'error', message: @post.errors.full_messages.to_sentence, flash: flash }
        end
      end
      format.js
    end
  end

  def destroy
    @post = resource
    @post.destroy
    redirect_to :posts
  end

  private

  def post_params
    params.require(:post).permit!
  end

  def collection
    Post.all
  end

  def resource
    collection.find(params[:id])
  end
end
