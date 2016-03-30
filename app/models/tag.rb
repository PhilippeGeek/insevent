class Tag < ActiveRecord::Base
  validates :name, length: 6..25, presence: true
  validates :color, presence: true, css_hex_color: true
end
