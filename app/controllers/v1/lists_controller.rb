class V1::ListsController < ApplicationController
    before_action :authenticaticate_user!

    def create
        group = Groups.find_by[id: params[:id]]
        @list = group.list.build(list_params)
        if @group.save
            render :create
        else
            render json: {errors: @list.errors.full_messages}
        end
    end

    def index
        @lists = Lists.all
        render :index
    end

    def show
        @list = Lists.find_by(id: params[:id])
        if @list
            render :show
        else
            render json: {errors: @list.errors.full_messages}
        end
    end

    def update
        @list = Lists.find_by(id: params[:id])
        if @list.update(list_params)
            render :update
        else
            render json: {errors: @list.errors.full_messages}
        end
    end

    def destroy
        list = Lists.find_by(id: params[:id])
        if group
            group.destroy
            render json: :ok
        else
            head(:unauthorized)
        end
    end

    private
    def list_params
        params.require(:list).permit(:name)
    end
end