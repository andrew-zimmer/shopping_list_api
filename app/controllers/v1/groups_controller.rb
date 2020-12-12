class V1::GroupsController < ApplicationController
    before_action :authenticaticate_user!

    def create
        user = Users.find_by[id: params[:id]]
        @group = user.build_group(group_params)
        if @group.save
            render :create
        else
            render json: {errors: @group.errors.full_messages}
        end
    end

    def index
        @groups = Groups.all
        render :index
    end

    def show
        @group = Groups.find_by(id: params[:id])
        if @group
            render :show
        else
            render json: {errors: @group.errors.full_messages}
        end
    end

    def update
        @group = Groups.find_by(id: params[:id])
        if @group.update(group_params)
            render :update
        else
            render json: {errors: @group.errors.full_messages}
        end
    end

    def destroy
        group = Groups.find_by(id: params[:id])
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
