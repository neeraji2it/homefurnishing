class Newsletter < ActionMailer::Base
  default from: "oe.member1@gmail.com"
  def send_contact(news_letter)
    @news_letter = news_letter
   # mail(:to => "info@rosara.in", :subject => 'Signup for newsletter')
    mail(:to => "bhagat@dine-media.com", :subject => 'Signup for newsletter')
  end


def order_info(order)
    @order = order
   # mail(:to => "info@rosara.in", :subject => 'New Order')
    mail(:to => "bhagat@dine-media.com", :subject => 'New Order')
end





end
