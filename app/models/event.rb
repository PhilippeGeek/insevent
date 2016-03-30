class Event < ActiveRecord::Base
  has_and_belongs_to_many :tags
  validates_presence_of :name, :description, :email, :website, :location, :time
  validates :email, email: true
end
