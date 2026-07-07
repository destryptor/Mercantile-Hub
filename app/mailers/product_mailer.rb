class ProductMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.product_mailer.in_stock.subject
  #
  def in_stock
    @greeting = "Hi"

    @product = params[:product]
    @subscriber = params[:subscriber]
    mail to: @subscriber.email, subject: "Product #{@product.name} is back in stock!"
  end
end
