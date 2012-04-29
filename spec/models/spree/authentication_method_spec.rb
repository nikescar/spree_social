require 'spec_helper'

describe Spree::AuthenticationMethod do
  describe "#client_options" do
    it "returns empty hash when ca_path is blank or nil" do
      Spree::AuthenticationMethod.new(:ca_path => "").client_options.should == {}
      Spree::AuthenticationMethod.new.client_options.should == {}
    end

    it "returns correct hash when ca_path has value" do
      Spree::AuthenticationMethod.new(:ca_path => "/etc/ssl/ca-cert.crt").client_options.should == {:ssl => {:ca_path => "/etc/ssl/ca-cert.crt"}}
    end
  end
end