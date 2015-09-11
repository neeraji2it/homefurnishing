require "spec_helper"

describe Newsletter do
  describe "send_contact" do
    let(:mail) { Newsletter.send_contact }

    it "renders the headers" do
      mail.subject.should eq("Send contact")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
