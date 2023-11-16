class PaymentsController < ApplicationController
  def index
    @payments = current_user.payments
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
end
