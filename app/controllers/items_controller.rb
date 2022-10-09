class ItemsController < ApplicationController
  before_action :authenticate_user! ,except: [:index,:show]
  before_action :set_item, only: [:show,:edit,:update,:destroy]
  #学習用メモ before_action :contributor_confirmation, only:[:edit,:update] 

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

   def edit
    unless current_user == @item.user
      redirect_to root_path
    end
   end

   def update
    @item.update(item_params) 
    if @item.save
      redirect_to item_path 
    else
      render :edit
    end
   end

   def destroy
     @item.destroy
      redirect_to root_path
  end
    


   private

   def item_params
    params.require(:item).permit(:name,:description,:category_id,:status_id,:delivery_cost_id,:prefecture_id,:delivery_date_id,:image,:price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  #学習用メモ
  # def contributor_confirmation
  #   redirect_to root_path unless current_user == @item.user
  # end


end


