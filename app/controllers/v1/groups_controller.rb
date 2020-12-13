class V1::GroupsController < ApplicationController
    before_action :authenticate_user!

    def create
        user = User.find_by(email: params[:user_email])
        @group = user.groups.build(group_params)
        if user.save
            render :create
        else
            render json: {errors: @group.errors.full_messages}
        end
    end

    def index
        @groups = Group.all
        render :index
    end

    def show
        @group = Group.find_by(id: params[:id])
        if @group
            render :show
        else
            render json: {errors: @group.errors.full_messages}
        end
    end

    def update
        @group = Group.find_by(id: params[:id])
        if @group.update(group_params)
            render :update
        else
            render json: {errors: @group.errors.full_messages}
        end
    end

    def destroy
        group = Group.find_by(id: params[:id])
        if group
            group.destroy
            render json: :ok
        else
            head(:unauthorized)
        end
    end

    private
    def group_params
        params.require(:group).permit(:name)
    end
end
