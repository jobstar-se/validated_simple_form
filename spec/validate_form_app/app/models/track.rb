class Track < ActiveRecord::Base
  validates :title, :presence => true
  validates :position, :presence => true
  validates :position, :uniqueness => true, :allow_blank => false
end
