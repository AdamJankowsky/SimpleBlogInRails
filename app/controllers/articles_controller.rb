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
    

    private
    def article_params
        return params.require(:article).permit(:title, :text)
    end
    
end
