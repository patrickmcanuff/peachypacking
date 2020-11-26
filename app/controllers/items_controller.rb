class ItemsController < ApplicationController
  def edit
    @item = Item.find(params[:id])
    @box = Box.find_by(project_id: @item.project_id)
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to home_path
  end

  def destroy
    item = item.find(params[:id])
    item.destroy
    redirect_to home_path
  end

  def new
    @project = Project.find(params[:project_id])
    @item = Item.new
    @tag = Tag.all
  end

  def create
    @item = Item.new(item_params)
    project = Project.find(params[:project_id])
    @item.project = project
    unless params[:item][:box_id].empty?
      @item.box = Box.find(params[:item][:box_id])
    end
    if @item.save
     @tag = Tag.find(params[:item][:tags])
      itemtag = ItemTag.create(tag_id: @tag.id, item_id: @item.id)
      redirect_to project_items_path(project)
    else
      render :new
    end
  end

  def item_params
    params.require(:item).permit(:name, :comment, :box_id, :packing_date)
  end
end
