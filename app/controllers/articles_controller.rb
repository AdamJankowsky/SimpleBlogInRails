class ArticlesController < ApplicationController
  before_filter :authorize, except: [:show, :index]

  def new

  end

  def create
    if (params[:article][:id] != '')
      article = Article.find(params[:article][:id])
      if  article.poster_id != current_user.id
        flash[:error] = 'You can not edit not your posts'
        return redirect_to '/'
      end

      article.update_attributes(article_params)
      flash[:success] = 'Post updated'
      return redirect_to article
    end

    @article = Article.new(article_params)
    @article.date = DateTime.now
    @article.poster_id = current_user.id

    @article.save
    flash[:success] = "Post created"
    redirect_to @article
  end

  def show
    @article = Article.find(params[:id])
    @comments = Comment.where(:post_id => @article.id)
  end

  def index
    @articles = Article.all;
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.poster_id = current_user.id
      if @article.destroy
        flash[:success] = "Post deleted"
        return redirect_to articles_path
      end
      flash[:error] = "Could not delete post"
      return redirect_to articles_path
    else
      flash[:error] = "You can not delete that article"

    end
    redirect_to articles_path

  end

  def edit
    @article = Article.find(params[:id])
    render 'new'
  end

  def new_comment
    nComment = Comment.new(comment_params)
    nComment.save
    redirect_to Article.find(nComment.post_id)
  end

  def destroy_comment
    comment_to_delete = Comment.find(params[:id])
    if current_user.id == comment_to_delete.user_id
      comment_to_delete.destroy
    end
    article = Article.find(comment_to_delete.post_id)
    redirect_to article
  end


  private
  def article_params
    return params.require(:article).permit(:title, :text)
  end

  def comment_params
    return params.require(:new_comment).permit(:text, :user_id, :post_id)
  end

end
