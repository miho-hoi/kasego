class RecordsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @user = User.all
    @today_month = Date.today.month
    if user_signed_in?
      @user_total_prices_month = current_user.records.joins(:to_do).where('EXTRACT(MONTH FROM records.date) = ?', @today_month).sum('to_dos.price * times')
      @records = current_user.records.where("EXTRACT(MONTH FROM date) = ?", @today_month).order(date: "DESC")
    else
      @user_total_prices_month = {}
      @to_dos = {}
    end
  end

  def new
    @record = Record.new
  end

  def create 
    @record = Record.new(record_params)
    if @record.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    record = Record.find(params[:id])
    record.destroy
  end

  def edit
    @record = Record.find(params[:id])
    unless current_user.id == @record.user_id
      redirect_to root_path
    end
  end

  def update
    @record = Record.find(params[:id])
    if @record.update(record_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def record_params
    params.require(:record).permit(:date, :to_do_id, :times).merge(user_id: current_user.id)
  end
end
