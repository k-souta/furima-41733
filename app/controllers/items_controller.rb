class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_item, only: [:edit]
  before_action :set_item, only: [:show, :edit, :update, :correct_item]
  def index
    @items = Item.all
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def correct_item
    return if @item.user.id == current_user.id

    redirect_to '/'
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :category_id, :cost_id, :item_explanation, :prefecture_id, :hidzuke_id, :price, :cost_load_id,
                                 :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
