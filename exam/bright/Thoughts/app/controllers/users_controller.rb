class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @ideas = Idea.find(params[:id])
        @idea = Idea.all
    end

    def create
        @user = User.create(user_param)

        if  @user.save
            session[:user_id] = @user.id 

            return redirect_to "/ideas"
        end

        flash[:errors] = @user.errors.full_messages

        return redirect_to :back

    end

      private
        def user_param
           params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
        end
end
