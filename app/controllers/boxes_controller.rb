class BoxesController < ApplicationController
  require 'rqrcode'
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

  def index
    @boxes = Box.where(project_id: params[:project_id])
  end

  def show
    @box = Box.find(params[:id])
    @project = @box.project
  end

  def new
    @project = Project.find(params[:project_id])
    @box = Box.new
  end

  def create
    @box = Box.new(box_params)
    @project = params[:project_id]
    @box.project_id = @project
    @box.qr_code = qr_render
    if @box.save
      redirect_to project_boxes_path(@project)
    else
      render :index
    end
  end

  def qr_show
    @qr_code_render = qr_render.html_safe
  end

  def qr_render
    qr = RQRCode::QRCode.new("#{request.base_url}/projects/#{@project}/boxes/#{@box}")
    svg_qr = qr.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 6,
      standalone: true
    )
  end

  private
  def box_params
    params.require(:box).permit(:name, :comment, :size, :packing_date, :project_id)
  end
end
