module V1
    class UsersController < ApplicationController


        def user_params
            params.require(:user).permit(:email, :password, :username)
        end
    end
end
