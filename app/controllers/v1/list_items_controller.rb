class V1::ListItemsController < ApplicationController
    before_action :authenticaticate_user!

    def create
        list = List.find_by[id: params[:id]]
        @item = list.item.build(list_item_params)
        if @item.save
            render :create
        else
            render json: {errors: @item.errors.full_messages}
        end
    end

    def index
        list = List.find_by[id: params[:id]]
        @items = list.items
        render :index
    end

    def show
        @item = items.find_by(id: params[:id])
        if @item
            render :show
        else
            render json: {errors: @item.errors.full_messages}
        end
    end

    def update
        @item = ListItem.find_by(id: params[:id])
        if @item.update(list_item_params)
            render :update
        else
            render json: {errors: @item.errors.full_messages}
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
        params.require(:list).permit(:name, :checked)
    end
end
