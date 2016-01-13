class PostsController < ApplicationController
  #respond_to :html, :json
  
  def index
    @posts = Post.order(:created_at => 'desc')
    #respond_with(@posts)
    respond_to do |format|
       format.html
    end
  end
  
  def create
    @post = Post.create(:message => params[:message])
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path }
        format.js
      else
        flash[:notice] = "Message failed to save."
        format.html { redirect_to posts_path }
      end
    end
  end
end
