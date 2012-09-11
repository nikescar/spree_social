class Spree::UserAuthentication < ActiveRecord::Base
  attr_accessible :provider, :uid
  belongs_to :user

  validates_presence_of :user, :provider, :uid

  validates_uniqueness_of :uid, :scope => :provider
end
