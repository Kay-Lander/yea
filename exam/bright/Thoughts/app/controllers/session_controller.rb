class SessionController < ApplicationController
    def create
        @user = User.find_by_email(params[:user][:email])

        if @user
            if @user.try(:authenticate, params[:user][:password])
                session[:user_id] = @user.id

                return redirect_to ideas_path
            end
            
            flash[:errors] = ["Stupid Monkey wrong password."]

        end
        
        flash[:errors] = ["Email account not valid"]

        return redirect_to :back
    end
    
    def destroy
        session.clear

        return redirect_to root_path
    end
end
