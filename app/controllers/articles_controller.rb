class ArticlesController < ApplicationController

       """before_action :find_article , only:[:show,:edit,:update,:delete]"""
       before_action :find_article , except:[:new,:create,:index,:from_author]
       """antes de entrar a estos metodos debes de estar authenticado """
       before_action :authenticate_user!, only:[:new,:create,:edit,:update,:delete]
      
       def index
        @articles = Article.all
       end
       
       def show
       end

       def edit
        puts "\n\n\n #{@article.persisted?} \n\n\n"
        puts 'ESTOY ES UN ECHO'
       end 

       def update
         @article.update(article_params)
            redirect_to @article
       end

       def new
        @article = Article.new 
       end
    
       def create
         @article = current_user.articles.create(article_params)
         redirect_to @article
       end

       def delete
          @article.destroy
          redirect_to root_path
       end 

       def from_author
         @user = User.find(params[:user_id])
       end  

       """        
       esta accion hace que el @article pueda ser llamado en todas las funciones sin tener que ponerlas
       en cada una de ellas en el before action se especifica en cuales funciones no aplica esto
       """
       def find_article
          @article = Article.find(params[:id])
       end 

       def article_params
         params.require(:article).permit(:title,:content)
       end  


end
