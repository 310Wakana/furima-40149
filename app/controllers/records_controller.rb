class RecordsController < ApplicationController
    before_action :authenticate_user!, only: [:index, :create]
    before_action :set_item, only: [:index, :create]

    def index
        gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
        if current_user.id != @item.user_id?
            @record_address = RecordAddress.new
        else
            redirect_to root_path
        end
    end

    def create
        @record_address = RecordAddress.new(record_params)
        if current_user.id != @item.user_id?
            if @record_address.valid?
            Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
            Payjp::Charge.create(
              amount: @item.price,
              card: record_params[:token],
              currency: 'jpy'
                )
            @record_address.save
            redirect_to root_path
            else
                gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
                render 'index', status: :unprocessable_entity
            end
        else
            redirect_to root_path
        end
    end

    private
    def record_params
        params.require(:record_address).permit(:postal_code, :prefecture_id, :municipality, :house_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def item_params
        @item = Item.find(params[:item_id])
    end

    def set_item
        @item = Item.find(item_params[:id])
        redirect_to root_path if @item.record.present?
    end
end