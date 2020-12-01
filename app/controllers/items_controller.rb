class ItemsController < ApplicationController
  def edit
    @item = Item.find(params[:id])
    @box = Box.find_by(project_id: @item.project_id)
  end

  def update
    item = Item.find(params[:id])
    project_id = item.project
    item.update(item_params)
    if item.box == nil
      redirect_to project_items_path(item.project.id)
    else
    redirect_to project_box_path(item.project.id, item.box.id)
    end
  end

  def destroy
    item = Item.find(params[:id])
    project_id = item.project
    item.destroy
    redirect_to project_items_path(project_id)
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
     # @tag = Tag.find(params[:item][:tags])
     # itemtag = ItemTag.create(tag_id: @tag.id, item_id: @item.id)
      if @item.box == nil
        redirect_to project_items_path(project)
      else
        redirect_to project_box_path(project, @item.box)
      end
    else
      render :new
    end
  end

  def add_items_to_box
    @box = Box.find(params[:box_id])
    @item = Item.new(item_params)
    @item.box = @box # this will set the `box_id` field automatically

    if @item.save
      # only redirect to the box show page IF the item was saved successfully
      redirect_to box_path(@box)
    else
      # rerender the new page with validation errors
      render "new"
    end
  end

  def index
    @items = Item.where(project_id: params[:project_id], box_id: nil)
    @project = Project.find(params[:project_id])
    @item = Item.new
  end

  def item_params
    params.require(:item).permit(:name, :comment, :box_id, :packing_date)
  end
end
