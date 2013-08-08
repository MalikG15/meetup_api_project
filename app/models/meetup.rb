class Meetup < ActiveRecord::Base
  has_many :comments
end
