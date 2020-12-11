class V1::SessionsController < ApplicationController

    def create

        @user = User.find_by(email: params[:email])

        if @user&.valid_password?(params[:password])

            render :create, status: :created

        else

            render json: {errors: ['Invalid email or password']}

        end

    end

    def destroy

        user = User.find_by(id: params[:id])

            user.authentication_token = nil

        if user.save

            render json: :ok

        else

            head(:unauthorized)

        end

    end

end
