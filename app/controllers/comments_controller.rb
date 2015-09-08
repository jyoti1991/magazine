class CommentsController < ApplicationController
  before_action :find_article
  before_action :find_comment,only: [:edit,:update,:destroy]
def index
    @comments = Comment.hash_tree
end 

 def new
  @comment = Comment.new(parent_id: params[:parent_id])
end     

def create
 @comment=@article.comments.create(comment_params.merge(:user_id => current_user.id))
 @comment.user_id =current_user.id
  if params[:comment][:parent_id].to_i > 0
    parent = Comment.find_by_id(params[:comment].delete(:parent_id))
    @comment = parent.children.build(comment_params)
    else
      @comment = Comment.new(comment_params)
  end
   if @comment.save
    flash[:success] = 'Your comment was successfully added!'
    redirect_to article_path(@article)
  else
    render 'new'
  end
end
  def edit
end
def update
    if @comment.update(comment_params)
        redirect_to articles_path
    else
      render 'edit'
end
end
def destroy
    @comment.destroy
    redirect_to articles_path(@article)
end
    private
def comment_params
  params.require(:comment).permit!
end
def find_article
  @article=Article.find(params[:article_id])
  end
  def find_comment
  @comment=@article.comments.find(params[:id])  
end
end
