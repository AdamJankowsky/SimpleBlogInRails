class ArticlesController < ApplicationController

    def new
    end
    
    def create
        if (params[:article][:id] != '')
            article = Article.find(params[:article][:id])
            article.update_attributes(article_params)
            redirect_to articles_path and return
        end
    
        @article = Article.new(article_params)
        @article.date = DateTime.now

        @article.save
        redirect_to @article
    end
    
    def show
        @article = Article.find(params[:id])
        @comments =  Comment.where(:post_id => @article.id)
    end

    def index
        @articles = Article.all;
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy

        redirect_to articles_path
    end

    def edit
        @article = Article.find(params[:id])
        render 'new'
    end

    def new_comment
        nComment = Comment.new(comment_params)
        nComment.save
    end

    def destroy_comment
        comment_to_delete = Comment.find(params[:id])
        if current_user && current_user.user_id = current_user.id
            comment_to_delete.destroy
        end
        redirect_to '/articles'
    end
    

    private
    def article_params
        return params.require(:article).permit(:title, :text)
    end
    def comment_params
        return params.require(:new_comment).permit(:text, :user_id, :post_id)
    end
    
end
