class Membership < ActiveRecord::Base
	

	belongs_to :user
	belongs_to :beer_club

	def to_s
    	"#{beer_club.name} #{user.username}"
  	end
end
