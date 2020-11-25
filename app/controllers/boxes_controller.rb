class BoxesController < ApplicationController
  def edit
    @box = Box.find(params[:id])
  end

  def update
    # raise
    box = Box.find(params[:id])
    box.update(box_params)
    redirect_to project_boxes_path(box.project)
  end

  def destroy
    box = Box.find(params[:id])
    box.destroy
    redirect_to project_boxes_path(box.project)
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
    project = params[:project_id]
    @box.project_id = project
    if @box.save
      redirect_to project_boxes_path(project)
    else
      render :index
    end
  end

  def box_params
    params.require(:box).permit(:name, :comment, :size, :packing_date, :project_id)
  end
end
