class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :authenticate_user!, only: [:edit]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      @item.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
       redirect_to root_path
    else
       render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item, :concept, :category_id, :state_id, :delivery_charges_id, :prefecture_id,
                                 :arrival_date_id, :price).merge(user_id: current_user.id)
  end
end
