class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :check_item_owner, only: [:edit, :update, :destroy]
  before_action :redirect_if_sold, only: [:edit]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
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

  def show
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end


  private

  def set_item
    @item = Item.find(params[:id])
  end

  def check_item_owner
    unless @item.user == current_user
      redirect_to root_path
    end
  end

  def check_item_sold
    if @orders.empty?
      redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :quality_id, :who_pay_id, :delivery_area_id, :delivery_day_id, :price ).merge(user_id: current_user.id)
  end

  def redirect_if_sold
    if @item.order.present?
      redirect_to root_path
    end
  end



end
