class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end
    
    def show
        @article = Article.find(params[:id])
    end
    
    def new
        @article = Article.new
    end
    
    def create
        @article = Article.new(article_params)
        @article.user = current_user
        #byebug
        
        if @article.save
            #byebug
            redirect_to @article
        else
            render 'new'
        end
    end
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end
    
    def destroy
        # byebug
        @article = Article.find(params[:id])
        @article.destroy
        # byebug
        redirect_to articles_path
    end 
    
    def sort_title
        @article = Article.all.sort_by article_params(:title)
    end
    
    def sort_movie
        @article = Article.all.sort_by article_params(:title)
    end
    
    def sort_date
        @article = Article.all.sort_by article_params(:date)
    end
    
    def sort_user
        @article = Article.all.sort_by article_params(:user)
    end
end

private
    def article_params
        params.require(:article).permit(:title, :text)
    end
