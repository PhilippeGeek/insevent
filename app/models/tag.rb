class Tag < ActiveRecord::Base
  has_and_belongs_to_many :events
  validates :name, length: 6..25, presence: true
  validates :color, presence: true, css_hex_color: true
end
