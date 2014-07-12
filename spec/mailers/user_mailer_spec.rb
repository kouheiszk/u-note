require "rails_helper"

RSpec.describe UserMailer, :type => :mailer do
  before do
    @subject = "Registration confirmation"
    @from = APP_CONFIG['email']['from']
    @login_path = "/users/sign_in"
    @site_title = "U-NOTE"
  end

  after(:all) do
    ActionMailer::Base.deliveries.clear
  end

  describe "registration_confirmation" do
    let(:new_user) { FactoryGirl.create(:user, email: "hoge@example.com", name: "hoge", password: "password") }
    let(:mail) { UserMailer.registration_confirmation(new_user) }
    let(:mail_body) { mail.body.encoded.split(/\r\n/).map{|i| Base64.decode64(i)}.join }

    specify { expect(ActionMailer::Base.deliveries).to be_empty }

    it "renders the headers" do
      expect(mail.subject).to eq @subject
      expect(mail.to.first).to eq new_user.email
      expect(mail.from.first).to eq @from
    end

    it "renders the body" do
      expect(mail_body).to match(/#{@login_path}/)
      expect(mail_body).to match(/#{@site_title}/)
    end

    describe "after sending the mail" do
      before do
        mail.deliver
      end

      let(:sent_mail) { ActionMailer::Base.deliveries.last }
      let(:sent_mail_body) { sent_mail.body.encoded.split(/\r\n/).map{|i| Base64.decode64(i)}.join }

      specify { expect(ActionMailer::Base.deliveries.count).to eq 1 }

      it "renders the headers" do
        expect(sent_mail.subject).to eq @subject
        expect(sent_mail.from.first).to eq @from
        expect(sent_mail.to.first).to eq new_user.email
      end

      it "renders the body" do
        expect(sent_mail_body).to match(/#{@login_path}/)
        expect(sent_mail_body).to match(/#{@site_title}/)
      end
    end
  end
end
