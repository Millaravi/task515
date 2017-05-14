class HomeController < ApplicationController
  def index
    @posts = Post.all
  end

  def create
    create_post = Post.new
    create_post.title = params[:title]
    create_post.editor = params[:editor]
    create_post.content = params[:content]
    create_post.save
    
    redirect_to '/'
  end

  def new
  end

  
  def update
    upd_post = Post.find(params[:post_id])
    upd_post.title = params[:title]
    upd_post.editor = params[:editor]
    upd_post.content = params[:content]
    upd_post.save
    redirect_to '/'
  end

   def comment_update
    upd_com = Comment.find(params[:comment_id])
    upd_com.content = params[:content]
    upd_com.save
    redirect_to '/'
  end
  
  def comment_updateview
    @upd_com = Comment.find(params[:comment_id])
  end
  def update_view
    @upd_post = Post.find(params[:post_id])
  end
  
  def delete
    del_post = Post.find(params[:post_id])
    del_post.destroy
    redirect_to '/'
  end
  
  def comment_create
  
    new_comment=Comment.new(content: params[:content], post_id: params[:post_id])
    new_comment.save
    
    redirect_to '/'
  end
  
 
  
  def comment_delete
    del_comment = Comment.find(params[:comment_id])
    del_comment.delete
    
    redirect_to '/'
  end
  
end
