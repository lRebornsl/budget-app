class PaymentsController < ApplicationController
  def index
    @payments = current_user.payments.includes(:category).order(date: :desc)
  end
end
