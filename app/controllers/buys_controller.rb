class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet, only: [:index, :create]
  before_action :contributor_confirmation, only: [:index]

  def index
    @buy_shipping_inform = BuyShippingInform.new
  end

  def create
    @buy_shipping_inform = BuyShippingInform.new(buy_params)
    if @buy_shipping_inform.valid?
      pay_item
      @buy_shipping_inform.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_shipping_inform).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_tweet
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: buy_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def contributor_confirmation
    redirect_to root_path if @item.buy.present?
    redirect_to root_path if current_user == @item.user
  end

end
