class Talker < ActiveRecord::Base
  attr_accessible :blurb, :producer, :product
  validates :producer, :product, :blurb, :presence => true
end
