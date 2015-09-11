class Newsletter < ActionMailer::Base
  default from: "oe.member1@gmail.com"
  def send_contact(news_letter)
    @news_letter = news_letter
   # mail(:to => "info@rosara.in", :subject => 'New User Registered')
    mail(:to => "bhagat@dine-media.com", :subject => 'New User Registered')
  end

end
