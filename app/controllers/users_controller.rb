class UsersController < ApplicationController
  before_action :move_to_index, only: :show

  def show
    @today_month = Date.today.month
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @user_total_prices_month = @user.records.joins(:to_do).where('EXTRACT(MONTH FROM records.date) = ?', @today_month).sum('to_dos.price * times')
    @records = @user.records.where("EXTRACT(MONTH FROM date) = ?", @today_month).order(date: "DESC")

    if @user == current_user
      redirect_to root_path
    end
  end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
