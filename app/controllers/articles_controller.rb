class ArticlesController < ApplicationController

    def show
        @article = Article.find(params[:id])
    end

        # security risks here - need to use "strong parameters"
        # @article = Article.new(params[:article])
 
        # @article.save
        # redirect_to @article

    def new
        @article = Article.new
      end
       
      def create
        @article = Article.new(article_params)
       
        if @article.save
          redirect_to @article
        else
          render 'new'
        end
      end
       
      private
        def article_params
          params.require(:article).permit(:title, :text)
        end
end
