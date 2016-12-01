class IdeasController < ApplicationController
    def index
        @ideas = Idea.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    end

    def create
        @idea = Idea.create(idea_params)
        if @idea.valid?
            flash[:success] = "success"
        else
            flash[:alert] = "ERROR!!! Please Try Again"
         end
        redirect_to root_path
    end
       
     def edit
        @idea = Idea.find(params[:id])
    end
    
    def update
        @idea = Idea.find(params[:id])
       if @idea.update(idea_params)
           flash[:success] = "Successfully Updated"
           redirect_to root_path
    else
        flash[:alert] = "OOPS!! looks like somethings missing."
        redirect_to edit_idea_path(parmas[:id])
    end
end

     def destroy
         @idea = Idea.find(params[:id])
         @idea.destroy
         flash[:success] = "Successfully Deleted"
         redirect_to root_path
        
     end
       
    private
    
    def idea_params
        params.require(:idea).permit(:description, :author)
    end
end
