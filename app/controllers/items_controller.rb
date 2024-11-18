class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  private

  def message_params
    params.require(:item).permit(:item_name, :category_id, :cost_id, :item_explanation, :prefecture_id, :hidzuke_id, :price,
                                 :image).merge(user_id: current_user.id)
  end
end
