class ApplicationMailer < ActionMailer::Base
  default from: "automated@placidity.com"

  def product_sale(product, user_info)
    @product = product
    @user_info = user_info
    mail(to: "emma@placidity.com, jeff@placidity.com", subject: "Sold: #{@product.name}")
  end
end
