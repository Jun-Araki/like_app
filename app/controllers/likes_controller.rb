class LikesController < ApplicationController
  def create
    current_user.likes.create!(post_id: params[:post_id])
    @post = Post.find(params[:post_id])
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.likes.find_by(post_id: params[:post_id]).destroy!
    @post = Post.find(params[:post_id])
    # redirect_back(fallback_location: root_path)
  end
end
