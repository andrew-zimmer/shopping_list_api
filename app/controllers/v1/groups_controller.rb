class V1::SessionsController < ApplicationController
    before_action :authenticaticate_user!

    def create
        user = Users.all.find_by[id: params[:id]]

    end

    def index

    end

    def show

    end

    def update

    end

    def destroy

    end

    private
    def group_params
        params.require(:group).permit(:name)
    end
end
