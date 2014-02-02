class User < ActiveRecord::Base
	include RatingAverage

	has_secure_password

	validates :username, uniqueness: true,
                       length: { in: 3..15 }

    validates :password_format, confirmation: true
    validates :password_confirmation, presence: true

    def password_format
  		has_one_uppercase_letter = password =~ /[A-Z]/
  		errors.add(:password, "must have one uppercase letter") unless has_one_uppercase_letter
  		has_one_number = password =~ /[0-9]/
  		errors.add(:password, "must have one number") unless has_one_number
  		length_minimum_4 = password =~ /.{4,}/
 		errors.add(:password, "length must be at least 4") unless length_minimum_4		
	end

	def to_s
    	"#{username}"
  	end


  	has_many :ratings, dependent: :destroy   # käyttäjällä on monta ratingia
  	has_many :beers, through: :ratings
  	has_many :memberships, dependent: :destroy
  	has_many :beer_clubs, through: :memberships
end