class PostsController < ApplicationController
  # validates :title, presence: true
  # validates :category, inclusion: ["Fiction", "Non-Fiction"]
  # validates :content, length: {minimum: 100}
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def show
    post = Post.find(params[:id])
    
    render json: post
  end

  def update
    post = Post.find(params[:id])

    post.update!(post_params)

    render json: post
  end

  private

  def render_unprocessable_entity_response(invalid)
    render json: {errors: invalid.record.errors}, status: :unprocessable_entity

  end

  def post_params
    params.permit(:category, :content, :title)
  end

end
