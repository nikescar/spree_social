class Spree::AuthenticationMethod < ActiveRecord::Base
  attr_accessible :provider, :api_key, :api_secret, :environment, :active, :ca_path

  def self.active_authentication_methods?
    found = false
    where(:environment => ::Rails.env).each do |method|
      if method.active
        found = true
      end
    end
    return found
  end

  scope :available_for, lambda { |user|
    sc = where(:environment => ::Rails.env)
    sc = sc.where(["provider NOT IN (?)", user.user_authentications.map(&:provider)]) if user and !user.user_authentications.empty?
    sc
  }

  def client_options
    {}.tap do |opts|
      opts.merge!(:ssl => {:ca_path => ca_path}) if respond_to?(:ca_path) and ca_path and !ca_path.blank?
    end
  end

end
