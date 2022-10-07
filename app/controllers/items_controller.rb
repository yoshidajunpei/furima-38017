class ItemsController < ApplicationController
  before_action :authenticate_user! ,except: [:index,:show,]
  before_action :set_item, only: [:edit, :show]

  def index
    @items = Item.all.order(id: "DESC")
  end
  
  def new
    @item = Item.new
  end

  
  def create
    @item = Item.new(item_params)
     if @item.save
      redirect_to root_path
     else
      render:new
     end
  end

   def show
   end


   private

   def item_params
    params.require(:item).permit(:name,:description,:category_id,:status_id,:delivery_cost_id,:prefecture_id,:delivery_date_id,:image,:price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end


end


