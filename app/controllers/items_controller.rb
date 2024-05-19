class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
       redirect_to item_path(@item.id)
    else
       render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    unless current_user == @item.user
      @item.destroy
      redirect_to item_path
    end
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :item, :concept, :category_id, :state_id, :delivery_charges_id, :prefecture_id,
                                 :arrival_date_id, :price).merge(user_id: current_user.id)
  end

  def set_item
      @item = Item.find(params[:id])
  end
end
