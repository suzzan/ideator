class IdeasController < ApplicationController
    def index
        @ideas = Idea.all
    end

    def create
        @ideas = Idea.create(idea_params)
        if @idea.valid?
            
        else
            
        end
        
        redirect_to root_path
    end
    
    def edit
        @idea = Idea.find(params[:id])
    end
    
    def update
        @idea = Idea.find(params[:id])
       if @idea.update(idea_params)
           redirect_to root_path
    else
        redirect_to edit_idea_path(parmas[:id])
    end
    
    def idea_params
        params.require(:idea).permit(:description, :author)
     end
 end
 end

