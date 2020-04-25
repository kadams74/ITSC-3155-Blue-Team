class SearchController < ApplicationController
    def search
        if params[:search].blank? #If the user enters no data in the field:
            redirect_to(articles_path, notice: "Please enter a value.") and return
        else # user entered data:
            @parameter = params[:search].downcase  
            @results = Article.all.where("lower(title) LIKE :search", search: "%#{@parameter}%")
        end  
    end
    
    def alert=(message)
        self[:alert] = message
    end
end
