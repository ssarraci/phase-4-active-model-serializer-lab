class PostsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    posts = Post.all
    render json: posts, each_serializer: PostSerializer
  end

  def show
    post = Post.find(params[:id])
    render json: post, each_serializer: PostSerializer
  end

  private

  def render_not_found_response
    render json: { error: "Post not found" }, status: :not_found
  end

end
