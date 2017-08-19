class IdeasController < ApplicationController

    def  index
        @idea = Idea.all
        @user = current_user
        @ideas_liked_ids = current_user.ideas_liked_ids
    end

    def show
        @ideas = Idea.all
        @idea = Idea.find(params[:id])
        @user = current_user

    end

    def create

        @ideas = Idea.create(post: params[:post], user: current_user)

        if @ideas.save
            flash[:notice] = ['Successful share your wisdom.']

            return redirect_to ideas_path
        end

        flash[:errors] = @ideas.errors.full_messages

        return redirect_to :back
    end 

    private
        def idea_params
            params.require(:idea).permit(:post).merge(user: current_user)
        end

end
