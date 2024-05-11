class ItemsController < ApplicationController
    before_action :authenticate_user!

    def index
        @items= Item.all
    end

    def new
        @item = Item.new
    end

    def create
        @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
    end

    private
    def item_params
        params.require(:item).permit(:image, :item, :concept, :category_id, :state_id, :delivery_charges_id, :prefecture_id, :arrival_date_id, :price ).merge(user_id: current_user.id)
    end
end