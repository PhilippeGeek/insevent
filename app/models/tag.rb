class Tag < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :color
end
