class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
 
  def order_confirmation
    @order = params[:order]
    mail(to: @order.email, subject: "Your Jungle order ##{} is confirmed")
  end
end

