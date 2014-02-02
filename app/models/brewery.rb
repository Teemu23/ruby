class Brewery < ActiveRecord::Base
  include RatingAverage

  validates :name, presence: true
  validates :year, length: { in: 1042..2014 }

  has_many :beers, dependent: :destroy  
  has_many :ratings, through: :beers

  def print_report
    puts name
    puts "established at year #{year}"
    puts "number of beers #{beers.count}"
    puts "number of ratings #{ratings.count}"
  end

  def restart
    self.year = 2014
    puts "changed year to #{year}"
  end
end

