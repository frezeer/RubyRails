class ArticlesController < ApplicationController

       def show
        @article = Article.find(params[:id])
       end

       def edit
        """
            @article = Article.find(params['id'])
        """    
             @article = Article.find(params['id'])
              puts "\n\n\n #{@article.persisted?} \n\n\n"
            
       end 

       def update
         @article = Article.find(params[:id])
         @article.update(title: params[:article][:title],content: params[:article][:content])

            redirect_to @article
       end 
       def new
        @article = Article.new 
       """
        @article.title = 'Demo'
       """  
       end
    
       def create
         @article = Article.create(title: params[:article][:title],content: params[:article][:content])
         render json: @article
       end


end
