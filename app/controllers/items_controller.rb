class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  before_action :set_tweet, only: [:edit, :show, :update, :destroy]

def index
  @items = Item.all.order(created_at: :desc)
end

def new
  @item = Item.new
end

def create
  @item = Item.new(item_params)
  if @item.save
    redirect_to root_path
  else
    render :new
  end
end

def show
end

def edit
end

def update
  if @item.update(item_params)
      redirect_to item_path(@item)
  else
    render :edit
  end
end

def destroy
  if @item.destroy
    redirect_to root_path
    else
    redirect_to root_path
    end
end

private
  def item_params
    params.require(:item).permit(:name, :image, :info, :price, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user == @item.user
  end

  def set_tweet
    @item = Item.find(params[:id])
  end
end