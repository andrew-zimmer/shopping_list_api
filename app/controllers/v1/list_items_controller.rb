class V1::ListItemsController < ApplicationController
    before_action :authenticate_user!

    def create
        list = List.find_by(id: params[:list_id])
        @list_item = list.list_items.build(list_item_params)
        if list.save
            render :create
        else
            render json: {errors: @list_item.errors.full_messages}
        end
    end

    def index
        list = List.find_by(id: params[:list_id])
        @list_items = list.list_items
        render :index
    end

    def show
        @list_item = ListItem.find_by(id: params[:id])
        if @list_item
            render :show
        else
            render json: {errors: @list_item.errors.full_messages}
        end
    end

    def update
        @list_item = ListItem.find_by(id: params[:id])
        if @list_item.update(list_item_params)
            render :update
        else
            render json: {errors: @list_item.errors.full_messages}
        end
    end

    def destroy
        item = ListItem.find_by(id: params[:id])
        if item
            item.destroy
            render json: :ok
        else
            head(:unauthorized)
        end
    end

    private
    def list_item_params
        params.require(:list_item).permit(:item, :checked)
    end
end
