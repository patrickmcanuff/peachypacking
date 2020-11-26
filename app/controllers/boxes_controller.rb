class BoxesController < ApplicationController
  def edit
    @box = Box.find(params[:id])
  end

  def update
    box = Box.find(params[:id])
    box.update(box_params)
    redirect_to project_boxes_path(box.project)
  end

  def destroy
    box = Box.find(params[:id])
    box.destroy
    redirect_to project_boxes_path(box.project)
  end

  def show
    @box = Box.find(params[:id])
  end

  def index
    @boxes = Box.all
  end

  def new
    @project = Project.find(params[:project_id])
    @box = Box.new
  end

  def create
    @box = Box.new(box_params)
    project = Project.find(params[:project_id])
    @box.project = project
    if @box.save
      @tag = Tag.find(params[:box][:tags])
      boxtag = BoxTag.create(tag_id: @tag.id, box_id: @box.id)
      redirect_to project_boxes_path(project)
    else
      render :index
    end
  end

  def box_params
    params.require(:box).permit(:name, :comment, :size, :packing_date, :project_id)
  end
end
