class ToDosController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @to_dos = ToDo.all.order(created_at: :DESC)
  end

  def new
    @to_do = ToDo.new
  end

  def create
    @to_do = ToDo.new(to_do_params)
    if @to_do.save
    redirect_to to_dos_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @to_do = ToDo.find(params[:id])
  end

  def update
    @to_do = ToDo.find(params[:id])
    if @to_do.update(to_do_params)
      redirect_to to_dos_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def to_do_params
    params.require(:to_do).permit(:content, :price )
  end
end
