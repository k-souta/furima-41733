class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    # @items = Item.all
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

  private

  def item_params
    params.require(:item).permit(:item_name, :category_id, :cost_id, :item_explanation, :prefecture_id, :hidzuke_id, :price, :cost_load_id,
                                 :image).merge(user_id: current_user.id)
  end
end
