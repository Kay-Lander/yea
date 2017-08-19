class LikesController < ApplicationController\

    def create
        Like.create(user: current_user, idea: Idea.find_by(params[:idea_id]))
    return redirect_to "/ideas"
  end

  def destroy
        Like.find_by(user: current_user, idea: Idea.find_by(params[:idea_id])).destroy
    return redirect_to :back
  end
end
