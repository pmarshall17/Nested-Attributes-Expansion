class Address < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :city, :state, :street, :zip
end
