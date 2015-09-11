class Newsletter < ActionMailer::Base
  #default from: "from@example.com"
  def send_contact(news_letter)
    @news_letter = news_letter
   # mail(:to => "info@rosara.in", :subject => 'New User Registered')
    mail(:to => "bhagat@dine-media.com", :subject => 'New User Registered')
  end

end
