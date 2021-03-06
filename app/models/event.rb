class Event < ActiveRecord::Base
  has_and_belongs_to_many :tags
  validates_presence_of :name, :description, :email, :website, :location, :time

  scope :published, -> () {where(published: true)}
end
