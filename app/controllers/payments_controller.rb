class PaymentsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @payments = @category.payments.order(created_at: :desc)
  end

  def new
    @category = Category.find(params[:category_id])
    @categories = current_user.categories.order(name: :asc)
    @payment = @category.payments.build
  end

  def create
    @category = Category.find(params[:category_id])
    @payment = current_user.payments.build(payment_params)

    if @payment.save
      redirect_to user_category_payments_path(current_user, @category)
    else
      @categories = current_user.categories.order(name: :asc)
      render :new, status: :unprocessable_entity
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:name, :amount, :category_ids)
  end
end
