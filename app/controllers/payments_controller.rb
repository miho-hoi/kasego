class PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, only: :new

  def index
    @payments = current_user.payments.order(date: "DESC").limit(6)
  end

  def new
    @prev_month = Date.today.prev_month.month
    @user_total_prices_prv_month = current_user.records.joins(:to_do).where('EXTRACT(MONTH FROM records.date) = ?', @prev_month).sum('to_dos.price * times')
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)

    if @payment.save
      redirect_to payments_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:date,:total_price).merge(user_id: current_user.id)
  end

  def move_to_index
    return if user_signed_in? && current_user.payments.where(date: Date.today.beginning_of_month..Date.today.end_of_month).empty?
    redirect_to root_path
  end
end
