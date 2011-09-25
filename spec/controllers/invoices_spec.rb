require "spec_helper"
describe InvoicesController do
  before :all do
    User.delete_all
    @user = User.new(:email => 'user@example.com', :password => 'password', :password_confirmation => 'password')
    @user.apikey = 'TESTAPIKEY'
    @user.secretkey = 'TESTSECRETKEY'
    @user.save!
  end
  context 'api request' do
    context 'create' do
      it 'should not create an invoice because the signature does not match' do
        signature = Digest::MD5.hexdigest("TESTSECRETKEYinvoice_number=1&customer_number=1")
        post :create, :format => 'json', :apikey => 'TESTAPIKEY', :signature => signature, :invoice_number => 1, :customer_id => 2
        response.should_not be_successful
        pp response.body
      end

      it 'should create an invoice because the signature does match' do
        signature = Digest::MD5.hexdigest("TESTSECRETKEYcustomer_id=1&invoice_number=1")
        post :create, :format => 'json', :apikey => 'TESTAPIKEY', :signature => signature, :invoice_number => 1, :customer_id => 1
        response.should be_successful
        pp response.body
      end

      it 'should not create an invoice without an apikey' do
        post :create, :format => 'json'
        response.should_not be_successful
        pp response.body
      end
    end
  end
end