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
    items = Item.where(box: box)
    items.each do |item|
      item.update(box_id: nil)
    end
    box.destroy
    redirect_to project_boxes_path(box.project)
  end

  def index
    @boxes = Box.where(project_id: params[:project_id])
    @project = Project.find(params[:project_id])
    @box = Box.new
  end

  def show
    @box = Box.find(params[:id])
    @project = @box.project
    @item = Item.new
  end

  def new
    @project = Project.find(params[:project_id])
    @box = Box.new
  end

  def create
    @box = Box.new(box_params)
    @project = params[:project_id]
    @box.project_id = @project
    if @box.save
      @box.update(qr_code: qr_render)
      redirect_to project_boxes_path(@project)
    else
      render :index
    end
  end

  def qr_show
    @box = Box.find(params[:id])
    @qr_code_render = @box.qr_code.html_safe
  end

  def qr_render
    qr = RQRCode::QRCode.new("#{request.base_url}/projects/#{@project}/boxes/#{@box.id}")
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
